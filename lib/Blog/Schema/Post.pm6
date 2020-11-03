use Red:api<2>;

unit model Blog::Schema::Post is table<post>;

has UInt        $!id        is serial;
has Str         $.title     is unique;
has Str         $.body      is column{ :type<text> };
has UInt        $!author-id is referencing(*.id, :model<Blog::Schema::User>);
has             $.author    is relationship(*.author-id, :model<Blog::Schema::User>);
has DateTime    $.created   is column .= now;
has DateTime    $.updated   is column .= now;
has DateTime    $.published is column{ :nullable };

method !update-time is before-update { $!updated .= now }