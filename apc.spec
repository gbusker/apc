#
#  apc tools for controlling APC power strips
#

name:      apc
summary:   apc - tools to switch apc power strips on and off
version:   0.04
release:   1
packager:    Gerd Busker - busker@busker.org
license:   Artistic
group:     Applications/System
buildroot: %{_tmppath}/%{name}-%{version}-%(id -u -n)
buildarch: noarch
prefix:    %(echo %{_prefix})
source:    %{name}-%{version}.tar.gz
requires:  perl > 5.6
requires:  net-snmp-utils

%description
None.


%prep
%setup -q
%build
perl Makefile.PL
make RPM_OPT_FLAGS="$RPM_OPT_FLAGS"

%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT
mkdir -p  $RPM_BUILD_ROOT/usr/share/snmp/mibs/
install PowerNet-MIB.txt $RPM_BUILD_ROOT/usr/share/snmp/mibs/



%clean
rm -rf $RPM_BUILD_ROOT

%files
/usr

