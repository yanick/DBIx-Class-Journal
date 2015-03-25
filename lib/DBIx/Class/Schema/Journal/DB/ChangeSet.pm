package DBIx::Class::Schema::Journal::DB::ChangeSet;

use base 'DBIx::Class::Core';

sub journal_define_table {
    my ( $class, $schema_class, $prefix ) = @_;

    $class->load_components(qw/InflateColumn::DateTime TimeStamp/);
    $class->table($prefix . 'changeset');

    $class->add_columns(
      ID => {
         data_type => 'integer',
         is_auto_increment => 1,
         is_primary_key => 1,
         is_nullable => 0,
      },
      user_id => {
         data_type => 'integer',
         is_nullable => 1,
         is_foreign_key => 1,
      },
      set_date => {
         data_type => 'timestamp',
         is_nullable => 0,
         set_on_create => 1,
      },
      session_id => {
         data_type => 'varchar',
         size => 255,
         is_nullable => 1,
      },
    );

    $class->set_primary_key('ID');
}

1;
