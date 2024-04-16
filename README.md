# Inception

I'm exploring system administration through Docker, virtualizing images in my personal VM for hands-on experience.

# How does TLS work?

TLS uses public-key cryptography(new window) to verify the authenticity of a website. Every website that uses HTTPS (TLS) generates a mathematically related key pair:

A private key, which is kept secret and used to sign data
A public key, which anyone can use to verify that data
When your browser tries to connect to a website (a domain name like proton.me), the server creates a digital signature(new window) using the private key, which the browser verifies using the corresponding public key. If successful, this verification proves you’re connecting to a server that belongs to the domain name you’re visiting.

But how can your browser be sure the server’s public key really belongs to that domain? To solve this problem, TLS uses TLS certificates to help verify the identity of the server you’re connecting to.

What is a TLS certificate?
A TLS certificate is a type of digital certificate issued by a certificate authority (CA)(new window) to certify the ownership of a public key.

TLS certificates usually contain the following information:

The subject domain name (for example, proton.me)
The name of the issuing CA
Additional subject domain names, including subdomains, if any
The date of issue
The expiry date
The public key used to verify data (the subject organization keeps the private key secret)
The CA digitally signs(new window) the certificate, so if you trust the CA, you can be sure the public key belongs to the owners of the subject domain name.

How does a TLS certificate work?
When you try to connect to a website using HTTPS, the website server sends your browser its TLS certificate.

Your browser then verifies that the certificate is valid and digitally signed(new window) by a trusted CA by comparing it with information it stores about trusted CAs. This verification process uses public-key cryptography like RSA(new window) or ECC(new window) to prove the CA signed the certificate.

The signed certificate verifies the website server’s public key, which confirms that you’re communicating with the genuine server of the website you’re visiting, like https://proton.me, and not a hacker.

The server also authenticates a key exchange, resulting in a one-time session key that is used to send encrypted and authenticated data between the clients and the server.

In simplified terms, here’s how your browser and a website server establish a secure connection using a TLS certificate.

<!--add image im my assets-->

![How does TLS work](./assets/how-tls-works.png)

# How to create a self-signed certificate

```bash
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365
```

# How to create a self-signed certificate with a password

```bash
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -passout pass:your_password
```

# How to create a self-signed certificate with a password and a passphrase

```bash
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -passout pass:your_password -passin pass:your_passphrase
```

# How to create a self-signed certificate with a password and a passphrase and a subject

```bash
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -passout pass:your_password -passin pass:your_passphrase -subj "/C=US/ST=New York/L=New York/O=Example/OU=Example/CN=example.com"
```

# How to create a self-signed certificate with a password and a passphrase and a subject and a SAN

```bash
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -passout pass:your_password -passin pass:your_passphrase -subj "/C=US/ST=New York/L=New York/O=Example/OU=Example/CN=example.com" -addext "subjectAltName=DNS:example.com,DNS:www.example.com"
```

# How to create a self-signed certificate with a password and a passphrase and a subject and a SAN and a CA

```bash
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -passout pass:your_password -passin pass:your_passphrase -subj "/C=US/ST=New York/L=New York/O=Example/OU=Example/CN=example.com" -addext "subjectAltName=DNS:example.com,DNS:www.example.com" -CA ca.pem -CAkey ca-key.pem -CAcreateserial -CAserial ca.srl
```

# Mariadb

Open another terminal and keep the terminal with the compose running. On this other terminal, run the following command to enter in the mariadb container.

```sql
docker exec -it mariadb /bin/bash
```

Then run the command to enter in the mysql

```sql
mysql -u your_user -p db_name
```

Then run the command to see the tables

```sql
SHOW TABLES;
```

If you see the tables, it means that all is ok. If you want to see the database, run the following command:

```sql
SELECT * FROM table_name\G;
```

And if you want to delete a row in a table, run the following command:

```sql
DELETE FROM table_name WHERE column_name = some_value;
```
