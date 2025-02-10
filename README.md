# sei5-infra

Este repositório contém a configuração necessária para executar o **SEI5** utilizando **Docker** e **Docker Compose**.

## Requisitos

Antes de iniciar a instalação, certifique-se de ter os seguintes requisitos atendidos:

- **Docker** instalado
- **Docker Compose** instalado

## Como subir o ambiente SEI5

### 1 **Clonar o repositório**
```sh
git clone git
cd sei5-infra
```


### 2 Build da imagem SEI5

O build da imagem deve ser feito a partir da raiz do projeto. O Dockerfile está localizado na pasta sei5, então execute:

```sh
docker build -t sei5-alpine:1.0.0 -f sei5/Dockerfile .
```

### 3 Baixar a imagem do Memcached

O Memcached é um serviço obtido diretamente do Docker Hub, portanto, não é necessário construir uma imagem. Para garantir que ele esteja disponível, execute:

```sh
docker pull memcached:1.6.36-alpine
```