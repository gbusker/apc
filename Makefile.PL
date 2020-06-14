use 5.008008;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME              => 'apc',
    EXE_FILES  	      => [ 'apc' ],
    VERSION_FROM      => 'apc', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'APC-MasterSwitch/lib/APC/MasterSwitch.pm', # retrieve abstract from module
       AUTHOR         => 'Gerd Busker <busker@busker.org>') : ()),
);
