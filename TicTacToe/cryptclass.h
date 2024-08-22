#pragma once

#include <crypt.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <assert.h>
#include <time.h>
#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/err.h>
#include <openssl/evp.h>
#include <QString>

#define BCRYPT_HASHSIZE 512
#define RANDBYTES 16
#define MIN_ROUNDS 4
#define MAX_ROUNDS 31
#define DEF_ROUNDS 12

/**
 * \file CryptClass.h
 *
 * \brief The CryptClass class Manges password encryption
 *        Manges encrypting user data to database
 *        Manges decrypting user data from database
 *        Interfaces with dbcontroller
 */
class CryptClass {
public:
    // Bcrypt
    //
    static int rand_read(int fd, char *out, size_t count);
    static int bcrypt_gensalt(int salt_rounds, char salt[BCRYPT_HASHSIZE]);
    static int bcrypt_hashpw(const char *passwd, const char salt[BCRYPT_HASHSIZE], char hash[BCRYPT_HASHSIZE]);
    static int bcrypt_checkpw(const char *passwd, const char hash[BCRYPT_HASHSIZE]);

    // Setters for key256 & iv128
    //
    static void setKey(QString hexKeyString);
    static void setIv(QString hexIvString);

    // Getters for key256 & iv128
    //
    static QString getKey() {return QString((char*) _key256);}
    static QString getIv()  {return QString((char*) _iv128); }

    // Base64
    //
#define BASE64ENCODED_LEN(textLen) ((4*((textLen+2)/3))+1)
#define BASE64DECODED_LEN(textLen) ((3*textLen/4)+1)
    static int base64encode(const char* textBuf, int textLen, char* encBuf);
    static int base64decode(const char* encBuf, int encLen, char* textBuf);

// AES256
//
#define AES256ENCODED_LEN(textLen) (((textLen/16)+1)*16)
    static int        aes256encode(const char* textBuf, int textLen, char* encBuf);
    static int        aes256decode(const char* encBuf, int encLen, char* textBuf);
    static QString    aes256toHexStr(const char* charBuf, int len);
    static QByteArray aes256fromHexStr(const QString qString);
    static QString    aes256toBase64Str(const char* aes2656Buf, int len);
    static QByteArray aes256fromBase64Str(const QString base64str);

    // Base64 representation of AES256 encoded data
    //
    static QString base64aes256encode(QString textString);
    static QString base64aes256decode(QString textString);


private:
    //256 bit AES key
    //
    static unsigned char _key256[256];

    // 128 bit AES initialization vector
    //
    static unsigned char _iv128[128];
};
