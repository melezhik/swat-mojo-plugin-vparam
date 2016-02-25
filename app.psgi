#!/usr/bin/env perl

use Mojolicious::Lite;

use strict;

get '/hello-world/' => sub {

    my $c = shift;

    #$self->vparam(login    => 'str');

    $c->render(text => 'Hello World!');

};

app->start;

