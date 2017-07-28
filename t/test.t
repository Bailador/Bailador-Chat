use v6.c;

use JSON::Fast;
use Test;

use Bailador::Test;

plan 1;

%*ENV<P6W_CONTAINER> = 'Bailador::Test';
%*ENV<BAILADOR_APP_ROOT> = $*CWD.absolute;
my $app = EVALFILE "bin/api.pl6";

subtest {
    plan 3;

    my %data = run-psgi-request($app, 'POST', '/api/0/register');
    my $json_str = %data<response>[2];
    %data<response>[2] = '';
    is-deeply %data<response>, [200, ["Content-Type" => "application/json"], ''], 'route GET /';
    is %data<err>, '';
    my %res := from-json $json_str;
    is-deeply %res, {
        result => 1,
    };
}, '/api/0/register';

