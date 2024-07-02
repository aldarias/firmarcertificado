# Scripts: firma.sh
# Por Paco Aldarias
# Fecha: 2.7.2024

echo Script para firmar pdfs de $origen en $destino
echo Crear un pdf con la firma transparente en pdf

origen="../certificados"
destino="../firmado"
firma="./"

rename 's/\ //g' $destino/*.pdf
rename 's/\_//g' $destino/*.pdf
rename 's/-//g' $destino/*.pdf

for i in $(ls $origen/*.pdf);do
   n=$(basename $i .pdf)
   pdftk "$origen/$n.pdf" background "$firma"firma.pdf output "$destino/$n.pdf"
done
