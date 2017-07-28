use v6;
use Bailador;
use JSON::Fast;

post '/api/0/register' => sub {
    content_type('application/json');
    my %res =
        result => 1,
    ;
    return to-json %res;
};


baile();
