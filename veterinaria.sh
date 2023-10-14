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


echo "Ingrese el nombre del dueño:"
read nombre_dueno
while : 
do
echo "Ingrese la cedula del dueño:"
read cedula_dueno

if (grep -q "$cedula_dueno" socios.txt); then
  echo "La cédula $cedula_dueno ya existe en el sistema."
  else
	break;
fi
done

mascotas=""
while :
do
echo "Ingrese la cantidad de Mascotas (hasta cuatro)."
read cant
if((cant>4))
then
  echo "No puede ingresar mas de 4 mascotas"
else 
break;
fi

done
for ((i = 1; i <= cant; i++)) do
  echo "Ingrese el nombre de la mascota $i :"
  read nombre_mascota
  echo "Ingrese la edad de la mascota $i:"
  read edad_mascota


  mascotas+="$nombre_mascota,$edad_mascota,"
done

echo "Ingrese una opción de contacto (mail o número de teléfono):"
read contacto

echo "$nombre_dueno,$cedula_dueno,$mascotas$contacto" >> socios.txt
;;
2) echo "Manejo Citas"
;;
3) 
  echo "Actualizar Sotck en Tienda"
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
  if grep -q "$codigoArticulo" articulos.txt; then
    echo "El artículo ya está agregado"
    sed -i "/$codigoArticulo/ s/\(.*,\)[0-9]*/\1$cantidad/" "articulos.txt"
  else
    echo "$categoria,$codigoArticulo,$nombre,$precio,$cantidad" >> articulos.txt
  fi
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