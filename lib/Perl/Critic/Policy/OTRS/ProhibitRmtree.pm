package Perl::Critic::Policy::OTRS::ProhibitRmtree;

# ABSTRACT: Do not use File::Path's rmtree

use strict;
use warnings;

use Readonly;

use Perl::Critic::Utils qw{ :severities :classification :ppi };
use base 'Perl::Critic::Policy';

our $VERSION = '1.02';

Readonly::Scalar my $DESC => q{ ERROR: Don't use File::Path::rmtree(). };
Readonly::Scalar my $EXPL => q{ It is obsolete and not thread safe in some versions of perl. Use File::Path::remove_tree() instead.' };

sub supported_parameters { return ()                     }
sub default_severity     { return $SEVERITY_HIGHEST;     }
sub default_themes       { return qw( otrs otrs_lt_3_3 ) }
sub applies_to           { return 'PPI::Token::Word'     }


sub violates {
    my ( $self, $elem, undef ) = @_;

    return if $elem ne 'rmtree';
    return if !is_function_call($elem);

    return $self->violation( $DESC, $EXPL, $elem );
}

1;

__END__

=pod

=head1 NAME

Perl::Critic::Policy::OTRS::ProhibitRmtree - Do not use File::Path's rmtree

=head1 VERSION

version 0.05

=head1 AUTHOR

Renee Baecker <module@renee-baecker.de>

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2013 by Renee Baecker.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)

=cut
