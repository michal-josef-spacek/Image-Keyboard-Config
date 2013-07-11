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
	$self->{'b_conf_align_horz'} = 'center';
	$self->{'b_conf_align_vert'} = 'middle';
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
	if (defined $self->{'backgroung_file'}) {
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
