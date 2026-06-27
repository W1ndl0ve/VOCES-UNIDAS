#!/bin/bash
echo "Generando proto..."
protoc --proto_path=proto --go_out=pb --go_opt=paths=source_relative proto/alerta.proto
protoc --proto_path=proto --dart_out=lib/generated proto/alerta.proto
echo "Iniciando Hub (Backend)..."
go run main.go