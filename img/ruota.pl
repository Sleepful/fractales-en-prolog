#!/usr/bin/perl
#
# Utility per ruotare immagini di 0-360 gradi

if ($#ARGV==-1) {
    die("Errore devi specificare il nome di un'immagine");
}

$img=$ARGV[0];

$opzioni = $ARGV[1];
  
if ($img =~ m/(\w+).gif/) {
    $pref = $1;
} else {
    die ("devi specificare un'immagine gif");
}

$zero="${pref}0.gif";
system("cp $img $zero");


for ($i=1; $i<=359; $i++) {
    $file="${pref}${i}.gif";
    system("cp $zero $file");
    system("mogrify -background 0 $opzioni -rotate $i  $file");
    print("Creo $file\n");
}




