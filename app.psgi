
# Application
package MyApp;

use Mojo::Base 'Mojolicious';

sub startup {

  my $self = shift;

  # Router
  my $r = $self->routes;

  # Route
  $r->get('/validate-email')->to(controller => 'Email', action => 'do');

  $self->plugin('Vparam');

}

package MyApp::Controller::Email;

use Mojo::Base 'Mojolicious::Controller';

# Action

sub do {

  my $self = shift;

  my $email = $self->param('email');

  $self->vparam( email => 'email');

  $self->render(text => $self->verror('email') ? ($self->verror('email'))."\n"  :  "You've got email from $email!\n" );

}

package main;

require Mojolicious::Commands;

Mojolicious::Commands->start_app('MyApp');

1;
