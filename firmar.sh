# Scripts: firma.sh
# Por Paco Aldarias
# Fecha: 2.7.2024

pdftk -v 2> echo "Necesita instalar pdftk" && sudo apt install pdftk
echo "Ejecutarcon: bash ./firmar.sh"

echo Script para firmar pdfs de $origen en $destino
echo Crear un pdf con la firma transparente en pdf

origen="./certificados"
destino="./firmado"
firma="./firma"

# Limpiando el nombre del certificado. Quitando guiones y blancos.
rename 's/\-//g' $origen/*.pdf
rename 's/\_//g' $origen/*.pdf
rename 's/\ //g' $origen/*.pdf

for i in $(ls $origen/*.pdf);do
   echo Firmando $i
   n=$(basename $i .pdf)
   pdftk "$origen/$n.pdf" background "$firma/"firma.pdf output "$destino/$n.pdf"
done
