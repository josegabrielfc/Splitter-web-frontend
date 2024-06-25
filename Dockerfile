FROM ubuntu:24.04

# Instalación de dependencias necesarias
RUN apt-get update && \
    apt-get install -y curl git unzip xz-utils zip libglu1-mesa python3

# Descargar Flutter SDK versión 3.16.5
RUN git clone https://github.com/flutter/flutter.git -b stable --depth 1 /flutter

# Agregar el ejecutable Flutter a la ruta
ENV PATH="/flutter/bin:${PATH}"

# Aceptar automáticamente las licencias de Flutter
RUN flutter doctor --android-licenses

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el código fuente de la aplicación
COPY . /app

# Actualizar Flutter a la versión 3.16.6 y paquetes, y compilar la aplicación
RUN flutter upgrade 3.19.6
RUN flutter pub get
RUN flutter build web

# Exponer el puerto en el que la aplicación Flutter estará escuchando
EXPOSE 8000

# Comando para ejecutar la aplicación Flutter web
CMD ["python3", "-m", "http.server", "8000", "--directory", "build/web"]
