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

mascotas=" ";
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
while :
do
echo "1. Agendar Cita"
echo "2. Consultar Citas"
echo "3. Eliminar Cita"
echo "4. Salir"
read opcion2
case $opcion2 in
1) echo "Agendar Cita"

echo "Ingrese el nombre"
read nombre
echo "Ingresar el Nombre de la Mascota"
read nombreMascota
echo "Ingrese el motivo de la Cita"
read motivo
echo "Ingresar el costo"
read costo
echo "Ingresar la fecha"
read fecha
while [[ ! $fecha =~ ^[0-9]{4}-[0-1]{1}[1-9]{1}-[0-3]{1}[0-9]$ ]]; do
    echo "Fecha invalida. Por favor, ingrese la fecha en el formato correcto (YYYY-MM-DD)"
    read fecha
done
echo "Ingrese la hora"
read hora

echo "$nombre,$nombreMascota,$motivo,$costo,$fecha,$hora" >> citas.txt
;;
2) echo "Consultar Citas"
  if [ -e "citas.txt" ]; then
    echo "No hay citas agendadas"
  else
    cat citas.txt
  fi

;;
4) break ;;
        *) echo "Opción no válida. Presione Enter para continuar." && read
    esac
done
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
   echo "Seleccione la categoría del producto: 1) Medicamentos 2) Suplementos 3) Accesorios"
   read categoria
   echo "Ingrese el código del producto:"
   read codigoArticulo
   echo "Ingrese la cantidad que desea comprar:"
   read cantidad

   if grep -q "$codigoArticulo" articulos.txt; then
       stock=$(grep "$codigoArticulo" articulos.txt | cut -d',' -f5)
       if (( stock >= cantidad )); then
           echo "Compra confirmada"
           nuevoStock=$((stock - cantidad))
           sed -i "/$codigoArticulo/ s/\(.*,\)[0-9]*/\1$nuevoStock/" "articulos.txt"
       else
           echo "No hay suficientes unidades en stock. Intente con una cantidad menor."
       fi
   else
       echo "El producto no existe"
   fi
;;
5) echo "Informe Mensual"
   echo "Ingrese el mes (número entre 1 y 12):"
   read mes

   while (( mes < 1 || mes > 12 )); do
       echo "Mes inválido. Por favor, ingrese un número entre 1 y 12:"
       read mes
   done

   totalVentas=$(grep -c "$mes" ventas.txt)
   if (( totalVentas > 0 )); then
       totalRecaudado=$(awk -F',' -v mes="$mes" '$2 == mes {sum += $3} END {print sum}' ventas.txt)
       promedio=$(echo "scale=2; $totalRecaudado / $totalVentas" | bc)
       echo "El promedio de lo recaudado en el mes $mes es: $promedio"
   else
       echo "No se realizaron ventas en el mes $mes"
   fi
;;
6)exit 0;;
#Alerta
*)echo "Opcion invalida..."
esac
done