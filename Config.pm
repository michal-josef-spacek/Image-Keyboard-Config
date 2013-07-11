package Image::Keyboard::Config;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);

# Version.
our $VERSION = 0.01;

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
	$self->{'b_cont_text'} = 'Foo';
	$self->{'b_conf_align'} = 'center';

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
	if (defined $self->{'backgroung_file'}) {
		$self->{'config'}->{'background'} = $self->{'background_file'};
	}

	# Button index.
	$self->{'button_index'} = 0;

	# Object.
	return $self;
}

# Align.
sub align {
	my ($self, $align) = @_;
	$self->{'b_cont_align'} = $align;
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
			'align' => $self->{'b_cont_align'},
			'string' => $self->{'b_cont_text'},
		},
	};
	return $self;
}

# Font.
sub font {
	my ($self, $color, $file, $size) = @_;
	$self->{'font_color'} = $color;
	$self->{'font_file'} = $file;
	$self->{'font_size'} = $size;
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
