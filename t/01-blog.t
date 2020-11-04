use Test;
use Red:api<2>;
use Blog::Schema;

red-defaults "SQLite";

blog-schema.drop.create;

my \User = blog-schema."Blog::Schema::User"();
my \Post = blog-schema."Blog::Schema::Post"();

isa-ok blog-schema."Blog::Schema::Post"(), Post;

my \u1 = User.^create: :name<user1>, :email<a@b.com>, :settings[%(:password<1234>)];

isa-ok u1, User;

my \p1 = u1.posts.create: :title<post001>, :body("a" x 1000);
isa-ok p1, Post;

is u1.last-created-post.title, p1.title;
is u1.last-created-post.body, p1.body;

is u1.last-published-post, Nil;

isa-ok u1.password, Str;
is u1.password, '$6Aa8fk/N2FeY';

ok not u1.check-password: "1111";
ok u1.check-password: "1234";

done-testing;
