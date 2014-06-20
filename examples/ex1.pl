#!/usr/bin/env perl

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