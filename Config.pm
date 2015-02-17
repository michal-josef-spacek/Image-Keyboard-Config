package Image::Keyboard::Config;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);

# Version.
our $VERSION = 0.02;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Background file.
	$self->{'background_file'} = undef;

	# Configuration structure.
	$self->{'config'} = {};

	# Font.
	$self->{'f_color'} = 'black';
	$self->{'f_file'} = undef;
	$self->{'f_size'} = 20;

	# Button content.
	$self->{'b_cont_align_horz'} = 'center';
	$self->{'b_cont_align_vert'} = 'middle';
	$self->{'b_cont_text'} = 'Foo';

	# Button padding.
	$self->{'b_padd_bottom'} = 0;
	$self->{'b_padd_left'} = 0;
	$self->{'b_padd_right'} = 0;
	$self->{'b_padd_top'} = 0;

	# Button box size.
	$self->{'b_box_height'} = 100;
	$self->{'b_box_width'} = 100;

	# Button image.
	$self->{'b_image'} = undef;

	# Button position
	$self->{'b_pos_left'} = 0;
	$self->{'b_pos_top'} = 0;

	# Process params.
	set_params($self, @params);

	# Set backgroung file.
	if (defined $self->{'background_file'}) {
		$self->{'config'}->{'background'} = $self->{'background_file'};
	}

	# Button index.
	$self->{'button_index'} = 0;

	# Object.
	return $self;
}

# Horizontal align.
sub align_horz {
	my ($self, $align) = @_;
	$self->{'b_cont_align_horz'} = $align;
	return $self;
}

# Vertical align.
sub align_vert {
	my ($self, $align) = @_;
	$self->{'b_cont_vert'} = $align;
	return $self;
}

# Draw button.
sub draw {
	my $self = shift;
	$self->{'button_index'}++;
	$self->{'config'}->{'button'}->{$self->{'button_index'}} = {
		'font' => {
			'color' => $self->{'f_color'},
			'file' => $self->{'f_file'},
			'size' => $self->{'f_size'},
		},
		'image' => $self->{'b_image'},
		'pos' => {
			'left' => $self->{'b_pos_left'},
			'top' => $self->{'b_pos_top'},
		},
		'text' => {
			'align' => {
				'horz' => $self->{'b_cont_align_horz'},
				'vert' => $self->{'b_cont_align_vert'},
			},
			'padding' => {
				'bottom' => $self->{'b_padd_bottom'},
				'left' => $self->{'b_padd_left'},
				'right' => $self->{'b_padd_right'},
				'top' => $self->{'b_padd_top'},
			},
			'string' => $self->{'b_cont_text'},
		},
	};
	return $self;
}

# Set font properties.
sub font {
	my ($self, $color, $file, $size) = @_;
	if (defined $color) {
		$self->{'f_color'} = $color;
	}
	if (defined $file) {
		$self->{'f_file'} = $file;
	}
	if (defined $size) {
		$self->{'f_size'} = $size;
	}
	return $self;
}

# Get configuration structure.
sub get {
	my $self = shift;
	return $self->{'config'};
}

# Height.
sub height {
	my ($self, $height) = @_;
	$self->{'b_box_height'} = $height;
	return $self;
}

# Image.
sub image {
	my ($self, $image) = @_;
	$self->{'b_image'} = $image;
	return $self;
}

# Left.
sub left {
	my ($self, $left) = @_;
	$self->{'b_pos_left'} = $left;
	return $self;
}

# Move to x, y coords.
sub move {
	my ($self, $x, $y) = @_;
	$self->{'b_pos_top'} += $y;
	$self->{'b_pos_left'} += $x;
	return $self;
}

# Padding.
sub padding {
	my ($self, $top, $right, $bottom, $left) = @_;
	$self->{'b_padd_bottom'} = $bottom;
	$self->{'b_padd_left'} = $left;
	$self->{'b_padd_right'} = $right;
	$self->{'b_padd_top'} = $top;
	return $self;
}

# Text.
sub text {
	my ($self, $text) = @_;
	$self->{'b_cont_text'} = $text;
	return $self;
}

# Top.
sub top {
	my ($self, $top) = @_;
	$self->{'b_pos_top'} = $top;
	return $self;
}

# Width.
sub width {
	my ($self, $width) = @_;
	$self->{'b_box_width'} = $width;
	return $self;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Image::Keyboard::Config - Perl class for image keyboard configuration creating.

=head1 SYNOPSIS

 use Image::Keyboard::Config;
 my $obj = Image::Keyboard->new(%parameters);
 my $obj = $obj->align_horz($align);
 my $obj = $obj->align_vert($align);
 my $obj = $obj->draw;
 my $obj = $obj->font($color, $file, $size);
 my $conf_hr = $obj->get;
 my $obj = $obj->height($height);
 my $obj = $obj->image($image);
 my $obj = $obj->left($left);
 my $obj = $obj->move($x, $y);
 my $obj = $obj->padding($top, $right, $bottom, $left);
 my $obj = $obj->text($text);
 my $obj = $obj->top($top);
 my $obj = $obj->width($width);

=head1 METHODS

=over 8

=item C<new(%parameters)>

Constructor.

=over 8

=item * C<background_file>

 Background file.
 Default values is undef.

=item * C<config>

 Configuration structure.
 Default value is {}.

=item * C<f_color>

 Font color.
 Default value is 'black'.

=item * C<f_file>

 Font file.
 Default value is undef.

=item * C<f_size>

 Font size.
 Default value is 20.

=item * C<b_cont_align_horz>

 Button content horizontal align.
 Default value is 'center'.

=item * C<b_cont_align_vert>

 Button content vertical align.
 Default value is 'middle'.

=item * C<b_cont_text>

 Button content text.
 Default value is 'Foo'.

=item * C<b_padd_bottom>

 Button bottom padding.
 Default value is 0.

=item * C<b_padd_left>

 Button left padding.
 Default value is 0.

=item * C<b_padd_right>

 Button right padding.
 Default value is 0.

=item * C<b_padd_top>

 Button top padding.
 Default value is 0.

=item * C<b_box_height>

 Button box height size.
 Default value is 100.

=item * C<b_box_width>

 Button box width size.
 Default value is 100.

=item * C<b_image>

 Buttom image.
 Default value is undef.

=item * C<b_pos_left>

 Button left position.
 Default value is 0.

=item * C<b_pos_top>

 Button top_position.
 Default value is 0.

=back

=item C<align_horz($align)>

 Horizontal align.
 Set $align to 'b_cont_align_horz' parameter.
 Returns object.

=item C<align_vert($align)>

 Vertical align.
 Set $align to 'b_cont_vert' parameter.
 Returns object.

=item C<draw()>

 Draw button.
 Returns object.

=item C<font($color, $file, $size)>

 Set font properties.
 Set $color to 'f_color' parameter.
 Set $file to 'f_file' parameter.
 Set $size to 'f_size' parameter.
 Returns object.

=item C<get()>

 Get configuration structure.
 Returns reference to hash with keyboard configuration.

=item C<height($height)>

 Height.
 Set $height to 'b_box_height' parameter.
 Returns object.

=item C<image($image)>

 Image.
 Set $image to 'b_image' parameter.
 Returns object.

=item C<left($left)>

 Left.
 Set $left to 'b_pos_left' parameter.
 Returns object.

=item C<move($x, $y)>

 Move to x, y coords.
 Add $x to 'b_pos_top' parameter.
 Add $y to 'b_pos_left' parameter.
 Returns object.

=item C<padding($top, $right, $bottom, $left)>

 Padding.
 Set $top to 'b_padd_top' parameter.
 Set $right to 'b_padd_right' parameter.
 Set $bottom to 'b_padd_bottom' parameter.
 Set $left to 'b_padd_left' parameter.
 Returns object.

=item C<text($text)>

 Text.
 Set $text to 'b_cont_text' parameter.
 Returns object.

=item C<top($top)>

 Top.
 Set $top to 'b_pos_top' parameter.
 Returns object.

=item C<width($width)>

 Width.
 Set $width to 'b_box_width' parameter.
 Returns object.

=back

=head1 ERRORS

 new():
         From Class::Utils::set_params():
                 Unknown parameter '%s'.

=head1 EXAMPLE

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Data::Printer;
 use Image::Keyboard::Config;

 # Object.
 my $conf = Image::Keyboard::Config->new(
        'b_image' => 'data/ex1/keyboard_button_small.png',
        'background_file' => 'data/ex1/keyboard_background.png',
        'f_file' => 'data/ex1/DejaVuSans.ttf',
 );

 # Draw two buttons.
 $conf->draw->move(100, 100)->draw;

 # Get configuration.
 my $conf_hr = $conf->get;

 # Dump configuration.
 p $conf_hr;

 # Output:
 # \ {
 #     background   "data/ex1/keyboard_background.png",
 #     button       {
 #         1   {
 #             font    {
 #                 color   "black",
 #                 file    "data/ex1/DejaVuSans.ttf",
 #                 size    20
 #             },
 #             image   "data/ex1/keyboard_button_small.png",
 #             pos     {
 #                 left   0,
 #                 top    0
 #             },
 #             text    {
 #                 align     {
 #                     horz   "center",
 #                     vert   "middle"
 #                 },
 #                 padding   {
 #                     bottom   0,
 #                     left     0,
 #                     right    0,
 #                     top      0
 #                 },
 #                 string    "Foo"
 #             }
 #         },
 #         2   {
 #             font    {
 #                 color   "black",
 #                 file    "data/ex1/DejaVuSans.ttf",
 #                 size    20
 #             },
 #             image   "data/ex1/keyboard_button_small.png",
 #             pos     {
 #                 left   100,
 #                 top    100
 #             },
 #             text    {
 #                 align     {
 #                     horz   "center",
 #                     vert   "middle"
 #                 },
 #                 padding   {
 #                     bottom   0,
 #                     left     0,
 #                     right    0,
 #                     top      0
 #                 },
 #                 string    "Foo"
 #             }
 #         }
 #     }
 # }

=head1 DEPENDENCIES

L<Class::Utils>.

=head1 SEE ALSO

L<Image::Keyboard>.

=head1 REPOSITORY

L<https://github.com/tupinek/Image-Keyboard-Config>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

 © 2013-2015 Michal Špaček
 BSD 2-Clause License

=head1 VERSION

0.02

=cut
