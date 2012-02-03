package Acme::Pandora;
BEGIN {
  $Acme::Pandora::VERSION = '0.01';
}

# ABSTRACT: make evil things happen if you open

use strict; 
use warnings;

use Encode;
use Scalar::Util;

sub open {
    my ($this) = @_;
    
    # A nice gentle start, just a performance hit
    my $string = $^X;
    my $is_perl = $string =~ /perl/i;
    my $value = $&;
    
    # Permanently change the encoding to Greek: iso-8859-7, subtle but fun
    my $encoding = Encode::find_encoding('iso-8859-7');    
    ${^ENCODING} = $encoding;
    
    # Cross to the dark side
    $^O = 'MSWin32';
    
    # Do evil stuff with file system permissions
    umask(256);
    
    # Evilly, we might just get killed at some point
    $SIG{ALRM} = sub { kill(6, getppid()) };
    alarm(int(rand(60*60*24*365)));
    
    return;
}

1;

=head1 NAME

Acme::Pandora - make evil things happen if you open

=head1 SYNOPSIS

  # Using the module is OK
  use Acme::Pandora;

  # But you don't want to do this...
  Acme::Pandora->open();
  
=head1 DESCRIPTION

When Pandora opens her box -- well, it was actually a jar but let's not quibble
about the details, all the evils of the world came out. After she closed it, the
only thing left in was hope. 

The principle behind this module is that it will change your Perl environment, 
and possibly even your system, in ways that are generally irreversible. 

Use this module with caution. Using it in production code is definitely not
recommended. Used incorrectly -- in fact, used at all -- it may cause harm to
kittens. 

=head1 METHODS

=over 4

=item Acme::Pandora->open()

If you call this function, all sorts of evil things will come out into your
Perl environment. 

=back

=head1 AUTHOR

Stuart Watt E<lt>stuart@morungos.comE<gt>

With an Honourable Mention to Dave Doyle. 

=head1 COPYRIGHT

Copyright 2012 by the authors.

This library is free software; you can redistribute it and/or modify it under the same 
terms as Perl itself.

=cut
