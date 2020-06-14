package APC::MasterSwitch;

use 5.008008;
use strict;
use warnings;

require Exporter;
our @ISA = qw( Exporter );
our @EXPORT = qw( apc_port_on apc_port_off apc_port_status );

use Carp;

sub apc_port_on
{
    my $host = shift;
    my $port = shift;
    check_host($host);
    check_port($port);
    system("snmpset -mPowerNet-MIB -c private -v 1 $host sPDUOutletCtl.$port = 1 1>/dev/null")

}

sub apc_port_off
{
    my $host = shift;
    my $port = shift;
    check_host($host);
    check_port($port);
    system("snmpset -mPowerNet-MIB -c private -v 1 $host sPDUOutletCtl.$port = 2 1>/dev/null")
}

sub apc_port_status
{
    my $host = shift;
    my $port = shift;
    check_host($host);
    check_port($port);
    open PIPE, "snmpget -mPowerNet-MIB -c private -v 1 $host sPDUOutletCtl.$port|" or Carp($!);
    my $line = <PIPE>;
    close PIPE;
    
    if ( $line =~ /outletOff/ ) {
	return "off";
    } else {
	return "on";
    }
}

sub check_host
{
    my $host = shift;
    unless ( $host =~ /^\S+$/ ) { carp("Invalid host name: $host") };
}

sub check_port
{
    my $port = shift;
    unless ( $port =~ /^\d+$/ ) { carp("Invalid port number: $port") };
}




1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

APC::MasterSwitch - Perl extension for blah blah blah

=head1 SYNOPSIS

  use APC::MasterSwitch;
  

=head1 DESCRIPTION

APC::MasterSwitch allows you to configure APC masterswitches via SNMP.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Refer to the APC website (http://www.apc.com).


=head1 AUTHOR

Gerd Busker, E<lt>busker@busker.org<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Gerd Busker

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
