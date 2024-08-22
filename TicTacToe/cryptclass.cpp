#include "cryptclass.h"
#include <crypt.h>
#include <QDebug>


unsigned char CryptClass::_key256[256];
unsigned char CryptClass::_iv128[128];


/***********************************************************************************************
 *
 * \fn CryptClass::rand_read
 *
 * \brief randon read
 * \param - int fd
 * \param - char *out
 * \param - size_t count
 * \return - int
 *
 ***********************************************************************************************/
int CryptClass::rand_read(int fd, char *out, size_t count)
{
    size_t total;
    ssize_t partial;

    total = 0;
    while (total < count)
    {
        for (;;) {
            errno = 0;
            partial = read(fd, out + total, count - total);
            if (partial == -1 && errno == EINTR)
                continue;
            break;
        }

        if (partial < 1)
            return -1;

        total += partial;
    }

    return 0;
}


/***********************************************************************************************
 *
 * \fn CryptClass::bcrypt_gensalt
 *
 * \brief Generate Salt Rounds
 * \param - int salt_rounds
 * \param - char salt[BCRYPT_HASHSIZE]
 * \return int
 *
 ***********************************************************************************************/
int CryptClass::bcrypt_gensalt(int salt_rounds, char salt[BCRYPT_HASHSIZE])
{
    int fd;
    char rand_salt[RANDBYTES];
    char *aux;

    // Get a random starting salt
    //
    fd = open("/dev/urandom", O_RDONLY);
    if (fd == -1) return 1;
    else if (rand_read(fd, rand_salt, RANDBYTES) != 0) {
        if (close(fd) != 0) return 2;
        else return 3;
    }
    if (close(fd) != 0) return 4;

    // Validate requested rounds
    //
    salt_rounds = (salt_rounds < MIN_ROUNDS || salt_rounds > MAX_ROUNDS)? DEF_ROUNDS:salt_rounds;

    // Get the final salt
    //
    aux = crypt_gensalt_rn("$2b$", salt_rounds, rand_salt, RANDBYTES, salt, BCRYPT_HASHSIZE);
    return (aux == NULL)?5:0;
}


/***********************************************************************************************
 *
 * \fn CryptClass::bcrypt_hashpw
 *
 * \brief Hash User Password
 * \param - const char *passwd
 * \param - const char salt[BCRYPT_HASHSIZE]
 * \param - char hash[BCRYPT_HASHSIZE]
 * \return int
 *
 ***********************************************************************************************/
int CryptClass::bcrypt_hashpw(const char *passwd, const char salt[BCRYPT_HASHSIZE], char hash[BCRYPT_HASHSIZE])
{
    char *aux;
    struct crypt_data data = {0};
    strcpy(data.input, passwd);
    strcpy(data.setting, salt);
    aux = crypt_rn(passwd, salt, &data, sizeof(data));
    strncpy(hash, data.output, BCRYPT_HASHSIZE);
    return (aux == NULL)?1:0;
}


/***********************************************************************************************
 *
 * \fn CryptClass::bcrypt_checkpw
 *
 * \brief Check Hashed Password
 * \param - const char *passwd
 * \param - const char hash[BCRYPT_HASHSIZE]
 * \return int
 *
 ***********************************************************************************************/
int CryptClass::bcrypt_checkpw(const char *passwd, const char hash[BCRYPT_HASHSIZE])
{
    int ret;
    char outhash[BCRYPT_HASHSIZE];



    ret = bcrypt_hashpw(passwd, hash, outhash);

#ifdef DEBUG
    qDebug() << __FUNCTION__ << passwd << hash << outhash << ret;
#endif

    if (ret != 0){
        qDebug() << "fail...";
        return -1;
    }

#ifdef DEBUG
    qDebug() << __FUNCTION__ << "string compare results: " << strcmp(hash, outhash);
#endif

    return strcmp(hash, outhash);
}


/***********************************************************************************************
 *
 * \fn CryptClass::base64encode
 *
 * \brief Encode String using Base64 Encoder
 * \param - const char* textBuf
 * \param - int len
 * \param - char* encBuf
 * \return int
 *
 ***********************************************************************************************/
int CryptClass::base64encode(const char* textBuf, int len, char* encBuf)
{
    int   estLen = 4*((len+2)/3);
    int   outLen = EVP_EncodeBlock((unsigned char*) encBuf, (unsigned char*) textBuf, len);
    encBuf[outLen]=0;
    if (estLen != outLen) {
        qDebug() << "Bad encode, estimated length: " << estLen << " got: " << outLen;
    }
    return outLen;
}


/***********************************************************************************************
 *
 * \fn CryptClass::base64encode
 *
 * \brief Decode String using Base64 Encoder
 * \param - const char* encBuf
 * \param - int len
 * \param - char* textBuf
 * \return int
 *
 ***********************************************************************************************/
int CryptClass::base64decode(const char* encBuf, int len, char* textBuf)
{
    int   estLen = 3*len/4;
    int   outLen = EVP_DecodeBlock((unsigned char*) textBuf, (unsigned char* )encBuf, len);
    textBuf[outLen] = 0;
    if (estLen != outLen) {
        qDebug() << "Bad decode, estimated length: " << estLen << " got: " << outLen;
    }
    return outLen;
}


// Setters for key256 & iv128
//

/***********************************************************************************************
 *
 * \fn CryptClass::setKey
 *
 * \brief Create Key (setter for key256)
 * \param - QString hexKeyString
 * \return void
 *
 ***********************************************************************************************/
void CryptClass::setKey(QString hexKeyString) {
    memcpy(_key256, QByteArray::fromHex(hexKeyString.toStdString().c_str()).constData(), 256);
}


/***********************************************************************************************
 *
 * \fn CryptClass::setIv
 *
 * \brief Create iv128 (setter for iv128)
 * \param - QString hexIvString
 * \return void
 *
 ***********************************************************************************************/
void CryptClass::setIv(QString hexIvString) {
    memcpy(_iv128, QByteArray::fromHex(hexIvString.toStdString().c_str()).constData(), 128);
}



/***********************************************************************************************
 *
 * \fn CryptClass::aes256encode
 *
 * \brief AES 256 Encoder
 * \param - const char* textBuf
 * \param - int textLen
 * \param - char* encBuf
 * \return int
 *
 ***********************************************************************************************/
int CryptClass::aes256encode(const char* textBuf, int textLen, char* encBuf)
{
    EVP_CIPHER_CTX* ctx;
    int len;
    int encLen;

    // Create new context
    //
    if (!(ctx = EVP_CIPHER_CTX_new())) {
        qDebug() << __FUNCTION__ << "Failed to create a new CTX context!";
        return -1;
    }

    // Init the encryption operation.
    //
    if (EVP_EncryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, _key256, _iv128) != 1) {
        qDebug() << __FUNCTION__ << "Failed to init the CTX context!";
        return -2;
    }

    // Provide the message to be encrypted, and obtain the encrypted output.
    //
    if (EVP_EncryptUpdate(ctx, (unsigned char*) encBuf, &len,
                          (unsigned char*) textBuf, textLen) != 1) {
        qDebug() << __FUNCTION__ << "Failed to encrypt:" << textBuf;
        return -3;
    }
    encLen = len;

    // Finalize the encryption.
    //
    if (EVP_EncryptFinal_ex(ctx, (unsigned char*) encBuf + len, &len) != 1) {
        qDebug() << __FUNCTION__ << "Failed to finalize encryption of:" << textBuf;
        return -4;
    }
    encLen += len;

    // Clean up
    //
    EVP_CIPHER_CTX_free(ctx);

    return encLen;
}


/***********************************************************************************************
 *
 * \fn CryptClass::aes256decode
 *
 * \brief AES 256 Decoder
 * \param - const char* encBuf
 * \param - int encLen
 * \param - char* textBuf
 * \return int
 *
 ***********************************************************************************************/
int CryptClass::aes256decode(const char* encBuf, int encLen, char* textBuf)
{
    EVP_CIPHER_CTX *ctx;
    int len;
    int textLen;

    // Create a new context
    //
    if (!(ctx = EVP_CIPHER_CTX_new())) {
        qDebug() << __FUNCTION__ << "Failed to get new CTX context!";
        return -1;
    }

    // Init the decryption operation
    //
    if (EVP_DecryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, _key256, _iv128) != 1) {
        qDebug() << __FUNCTION__ << "Failed to init the CTX context!";
        return -2;
    }

    // Provide the message to be decrypted, and obtain the textBuf output.
    //
    if (EVP_DecryptUpdate(ctx, (unsigned char*) textBuf, &len,
                          (unsigned char*) encBuf, encLen) != 1) {
        qDebug() << __FUNCTION__ << "Failed to decrypt encoded buffer:" << encBuf;
        return -3;
    }
    textLen = len;

    // Finalize the decryption.
    //
    if (EVP_DecryptFinal_ex(ctx, (unsigned char*)(textBuf + len), &len) != 1) {
        qDebug() << __FUNCTION__ << "Failed to finalize decryption of:" << encBuf;
        return -4;
    }
    textLen += len;

    // Clean up
    //
    EVP_CIPHER_CTX_free(ctx);
    return textLen;
}


/***********************************************************************************************
 *
 * \fn CryptClass::aes256toHexStr
 *
 * \brief AES 256 to Hex String
 * \param - const char* charBuf
 * \param - int len
 * \return int
 *
 ***********************************************************************************************/
QString CryptClass::aes256toHexStr(const char* charBuf, int len)
{
    QString ret = "";
    for (int i=0; i<len;++i)
        ret += QString("%1").arg((unsigned char) charBuf[i], 2, 16, QChar('0'));
    return ret;
}


/***********************************************************************************************
 *
 * \fn CryptClass::aes256fromHexStr
 *
 * \brief AES 256 from Hex String
 * \param - const char* charBuf
 * \param - int len
 * \return int
 *
 ***********************************************************************************************/
QByteArray CryptClass::aes256fromHexStr(const QString qString)
{
    QByteArray ret;
    for (int i=0; i<qString.size(); i+=2)
        ret.append((unsigned char) qString.sliced(i,2).toUShort(NULL,16));
    return ret;
}



/***********************************************************************************************
 *
 * \fn CryptClass::aes256toBase64Str
 *
 * \brief AES 256 to Base64 String
 * \param - const char* charBuf
 * \param - int len
 * \return int
 *
 ***********************************************************************************************/
QString CryptClass::aes256toBase64Str(const char* aes256buf, int len)
{
    // Use base64 encoding to create a utf8 compliant string that can be stored in a QString.
    //
    char encb64[BASE64ENCODED_LEN(len)];
    int enclen = CryptClass::base64encode(aes256buf, len, encb64);
    if (enclen < 0) return "";
    return QString(encb64);
}



/***********************************************************************************************
 *
 * \fn CryptClass::aes256fromBase64Str
 *
 * \brief AES 256 from Base64 String
 * \param - const char* charBuf
 * \param - int len
 * \return int
 *
 ***********************************************************************************************/
QByteArray CryptClass::aes256fromBase64Str(const QString base64str)
{
    // Decode the Base64 encoded AES string.
    //
    char aes256[BASE64DECODED_LEN(base64str.size())];
    QByteArray ba64 = base64str.toUtf8();
    int        blen = base64decode((const char*) ba64, ba64.size(), aes256);
#ifdef DEBUG
    qDebug() << __FUNCTION__ << ": blen:" << blen;
    qDebug() << __FUNCTION__ << ": rlen:" << (blen - (blen%16));
#endif
    if (blen < 0)  return QByteArray();

    // Base 64 encoding of AES data adds padding to the end of the data when creating the
    // Base64 representation of the data. Truncate the padding to return the original
    // AES encoded data.
    //
    return QByteArray(aes256,(blen - (blen%16)));
}


/***********************************************************************************************
 *
 * \fn CryptClass::base64aes256encode
 *
 * \brief base64 aes256 encode
 * \param - QString textString
 * \return int
 *
 ***********************************************************************************************/
QString CryptClass::base64aes256encode(QString textString)
{
    // Convert the text to a unicode/char16_t string to
    // provide for i18n storage.
    //
    int  wcharlen = textString.size()*sizeof(char16_t);
    char wcharbuf[wcharlen];
    memcpy(wcharbuf, textString.utf16(), wcharlen);

    // AES 256 encode the unicode string to create a
    // key encrypted representation of the string.
    //
    char enc[AES256ENCODED_LEN(wcharlen)];
    int  len = aes256encode(wcharbuf, wcharlen, enc);
    if (len < 0) return "";

    // Finally Base 64 encode the AES 256 encrypted data
    // to create an encoded buffer that can be stored as
    // string data in a QString.
    //
    QString ret = aes256toBase64Str(enc, len);

#ifdef DEBUG
    qDebug() << __FUNCTION__ << ": text len:" << textString.size();
    qDebug() << __FUNCTION__ << ": text str:" << textString;
    qDebug() << __FUNCTION__ << ": AES encoded len:" << len;
    qDebug() << __FUNCTION__ << ": AES encoded str:" << aes256toHexStr(enc,len);
    qDebug() << __FUNCTION__ << ": B64 encoded len:" << ret.size();
    qDebug() << __FUNCTION__ << ": B64 encoded AES:" << ret;
#endif
    return ret;
}



/***********************************************************************************************
 *
 * \fn CryptClass::base64aes256decode
 *
 * \brief Base64 aes256 Decode
 * \param - QString textString
 * \return int
 *
 ***********************************************************************************************/
QString CryptClass::base64aes256decode(QString textString)
{
    // Recover the Base 64 encoded AES 256 unicode data
    // from  the input string.
    //
    QByteArray txt  = aes256fromBase64Str(textString);

    // Decode the AES 256 data as a unicode string.
    //
    int        wlen = (txt.size()*sizeof(char16_t));
    char       dec[wlen];
    int        len = aes256decode(txt, txt.size(), dec);

    // Return the string represented by the decoded
    // unicode string.
    //
    QString    ret = QString::fromUtf16((char16_t*) dec, len/sizeof(char16_t));

#ifdef DEBUG
    qDebug() << __FUNCTION__ << ": B64 decoded len:" << txt.size();
    qDebug() << __FUNCTION__ << ": B64 decoded AES:" << aes256toHexStr(txt,txt.size());
    qDebug() << __FUNCTION__ << ": AES decoded len:" << len;
    qDebug() << __FUNCTION__ << ": AES decoded str:" << ret;
#endif
    return ret;
}

