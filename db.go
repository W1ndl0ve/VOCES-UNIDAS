package main

import (
	"fmt"

	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

type AlertaDB struct {
	gorm.Model
	ReporterId string
	Mensaje    string
	TipoAlerta int32
}

var DB *gorm.DB

func InitDB() {
	var err error
	DB, err = gorm.Open(sqlite.Open("voces_unidas.db"), &gorm.Config{})
	if err != nil {
		panic("No se pudo conectar a la base de datos")
	}

	// tabla para la base de datos
	err = DB.AutoMigrate(&AlertaDB{})
	if err != nil {
		fmt.Println("Error al migrar:", err)
	} else {
		fmt.Println("Base de datos lista y tabla creada.")
	}
}
