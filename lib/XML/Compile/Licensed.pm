use warnings;
use strict;

package XML::Compile::Licensed;

use File::Spec     ();
use File::Basename qw/dirname/;

=chapter NAME
XML::Compile::Licensed - collection of schema's which have restricted licenses

=chapter SYNOPSIS

=chapter DESCRIPTION

Many XML schema's and WSDL files have copyrights and restricted licenses.
For instance, because a party (like W3C) does not want to other people to
edit their published standards.  You are allowed to copy and use these
files freely, but not change them.  For some open source environments,
like Debian, do not like these restrictions, hence put them in the
'non-free' packages.

But there are also even less-free schema's which you may need.
For instance, if you speak to a BEA SOAP server, you may get responses
which contain elements which are in some BEA namespace.  Often, the
license of those schema files are unclear.  So, read the following
carefully:

B<The files contained in this distribution were available on internet.
Their use may be restricted, for instance may need a server license.
The author of this module does not grant you any rights on these files.>

When you are owner of any material in here, please contact the author of
this distribution to explicitly state the license on these files.

=chapter METHODS

=c_method soapServer $type
Currently supported are "BEA" and "SharePoint".
=cut

our %soap_servers =
  ( BEA =>          # Oracle's BEA
      { xsddir => 'bea'
      , xsds   => [ qw(bea_wli_sb_context.xsd bea_wli_sb_context-fix.xsd) ]
      }
  , SharePoint =>   # MicroSoft's SharePoint
      { xsddir => 'sharepoint'
      , xsds   => [ qw(sharepoint-soap.xsd sharepoint-serial.xsd) ]
      }
  );

sub soapServer($)
{   my ($class, $type) = @_;
    my $config = $soap_servers{$type} or return ();

    my $up     = dirname __FILE__;
    my $xsddir = File::Spec->catdir($up, 'SOAP', 'xsd', $config->{xsddir});
    ($xsddir, $config);
}

1;
