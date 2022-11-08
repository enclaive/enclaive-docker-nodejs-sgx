FROM enclaive/gramine-os:jammy-33576d39

RUN apt-get update \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app/

COPY ./node.manifest.template /app/

RUN gramine-manifest -Darch_libdir=/lib/x86_64-linux-gnu node.manifest.template node.manifest \
    && gramine-sgx-sign --key "$SGX_SIGNER_KEY" --manifest node.manifest --output node.manifest.sgx \
    && gramine-sgx-get-token --output node.token --sig node.sig

VOLUME /data/

EXPOSE 3000

ENTRYPOINT [ "/usr/local/bin/gramine-sgx", "node" ]
