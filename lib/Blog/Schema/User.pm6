use Red:api<2>;

unit model Blog::Schema::User is table<blog_user>;

has UInt $!id       is serial;
has Str  $.name     is column;
has Str  $.email    is unique;
has      @.posts    is relationship(*.author-id, :model<Blog::Schema::Post>);
has      @.settings is relationship(*.user-id,   :model<Blog::Schema::UserSettings>);

method password {
    @!settings.head.password
}

method check-password(|c) {
    @!settings.head.check-password: |c
}

method last-created-post {
    @!posts.sort(-*.created).first
}

method last-published-post {
    @!posts.grep(*.published).sort(-*.published).first
}