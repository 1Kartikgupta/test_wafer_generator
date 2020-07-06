#!/usr/bin/perl -w
use strict;

my $l=5;
my $um=10;

my %rul=();

$rul{'padsize'}=10*$um; # 220 um
$rul{'viasize'}=2*$l;
$rul{'min_spacing_m1contact_m1contact'}=3*$l;
$rul{'minimum_enclosure_metal1_m1contact'}=1*$l;

open OUT,">pad.mag";
print OUT "magic\n";
print OUT "tech scmos\n";
print OUT "timestamp 1\n";
sub Pad($$)
{
  my ($x0,$y0)=@_;
  my $padsize=$rul{'padsize'};
  # Pad
  foreach my $layer ("metal1","metal2","metal3")
  {
    print OUT "<< $layer >>\n";
    print OUT "rect $x0 $y0 ".($x0+$padsize)." ".($y0+$padsize)."\n";
  }

  #Vias to connect the metal layers:
  my $viasize=$rul{'viasize'};
  my $minspac=$rul{'min_spacing_m1contact_m1contact'};
  my $minenc=$rul{'minimum_enclosure_metal1_m1contact'};
  foreach (my $x1=$x0+$minenc; $x1<$padsize-$minenc-$viasize; $x1+=$minspac+$viasize)
  {
    my $y1=$y0+$minenc;
    my $y2=$y0+$padsize-$viasize-$minenc;
    foreach my $layer("m1contact","m2contact")
    {
      print OUT "<< $layer >>\n";
      print OUT "rect $x1 $y1 ".($x1+$viasize)." ".($y1+$viasize)."\n";
      print OUT "rect $x1 $y2 ".($x1+$viasize)." ".($y2+$viasize)."\n";
    }
  }
  foreach (my $y1=$y0+$minenc; $y1<$padsize-$minenc-$viasize; $y1+=$minspac+$viasize)
  {
    my $x1=$x0+$minenc;
    my $x2=$x0+$padsize-$viasize-$minenc;
    foreach my $layer("m1contact","m2contact")
    {
      print OUT "<< $layer >>\n";
      print OUT "rect $x1 $y1 ".($x1+$viasize)." ".($y1+$viasize)."\n";
      print OUT "rect $x2 $y1 ".($x2+$viasize)." ".($y1+$viasize)."\n";
    }
  }
  print OUT "<< labels >>\n";
  my $dx=$x0+int($padsize/2);
  my $dy=$y0+int($padsize/2);
  print OUT "rlabel metal3 $dx $dy $dx $dy 1 PAD\n";


}


Pad(10,10);

print OUT "<< end >>\n";
