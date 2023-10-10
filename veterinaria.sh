#!/bin/bash
while :
do
echo ""
echo "1. Registro Socio"
echo "2. Manejo Citas"
echo "3. Actualizar Stock en Tienda"
echo "4. Venta Productos"
echo "5. Informe Mensual"
echo "6. Salir"
echo ""
echo  "Escoger opcion: "
read opcion
#Seleccion de menu
case $opcion in
1) echo "Registro de Socios"

# Solicitar datos del dueño
echo "Ingrese el nombre del dueño:"
read nombre_dueno
while : 
do
echo "Ingrese la cedula del dueño:"
read cedula_dueno

# Verificar si la cédula ya existe en el archivo
if grep -q "$cedula_dueno" socios.txt; then
  echo "La cédula $cedula_dueno ya existe en el sistema."
  else
	break;
fi
done

# Solicitar datos de las mascotas (hasta cuatro)
mascotas=""
for ((i = 1; i <= 4; i++)); do
  echo "Ingrese el nombre de la mascota $i (o deje en blanco para finalizar):"
  read nombre_mascota
  if [ $nombre_mascota = " " ]; then
    break
  fi

  echo "Ingrese la edad de la mascota $i:"
  read edad_mascota

  # Agregar los datos de la mascota al string
  mascotas+="$nombre_mascota,$edad_mascota,"
done

# Solicitar opción de contacto
echo "Ingrese una opción de contacto (mail o número de teléfono):"
read contacto

# Agregar los datos al archivo "socios.txt"
echo "$nombre_dueno,$cedula_dueno,$mascotas$contacto" >> socios.txt
;;
2) echo "Manejo Cit"
;;
3) echo "Actualizar Sotck en Tienda"
  echo "Ingrese Categoria"
  read categoria
  echo "Ingrese Codigo de Articulo"
  read codigoArticulo
  echo "Ingrese el nombre del Articulo"
  read nombre;
  echo "Ingrese Precio"
  read precio
  echo "Ingrse Cantidad"
  read cantidad

;;
4) echo "Venta de Productos"
;;
5) echo "Informe Mensual"
;;
6)exit 0;;
#Alerta
*)echo "Opcion invalida..."
esac
done

