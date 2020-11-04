use Red;
use RedX::HashedPassword;

unit model Blog::Schema::UserSettings is table<passwd>;

has UInt $!user-id  is column{ :id, :references{ .id }, :model-name<Blog::Schema::User> };
has Str  $.password is password handles <check-password>;