unit module Blog::Schema;
use Red:api<2>;

sub blog-schema is export { schema <Blog::Schema::Post Blog::Schema::User> }