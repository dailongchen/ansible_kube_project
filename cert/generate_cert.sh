# cfssl print-defaults config > ca-config-default.json
# cfssl print-defaults csr > ca-csr-default.json
# cfssl print-defaults csr > client.json

cfssl gencert -initca ca-csr.json | cfssljson -bare ca -
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=server server.json | cfssljson -bare server
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=client client.json | cfssljson -bare client

# openssl x509 -in ca.pem -text -noout
# openssl x509 -in server.pem -text -noout
# openssl x509 -in client.pem -text -noout

rm crts/*
mv *.pem crts
rm *.csr