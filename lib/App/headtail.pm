package App::headtail;

use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

sub run {
    my %opts = @_;

    if (defined $opts{lines}) {
        my (@first, @last);

        while (<>) {
            push @first, $_ unless @first >= $opts{lines};
            push @last , $_; shift @last if @last > $opts{lines};
        }

        if ($. < @first + @last) {
            splice @last, 0, (@first + @last) - $.;
        }

        print for @first;
        print for @last;

    } else {
        die;
    }
}


1;
# ABSTRACT: head+tail

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

See the command-line script L<headtail>.

=cut
