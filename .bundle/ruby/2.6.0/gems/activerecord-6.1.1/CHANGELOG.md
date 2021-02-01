## Rails 6.1.1 (January 07, 2021) ##

*   Fix fixtures loading when strict loading is enabled for the association.

    *Alex Ghiculescu*

*   Fix `where` with custom primary key for belongs_to association.

    *Ryuta Kamizono*

*   Fix `where` with aliased associations.

    *Ryuta Kamizono*

*   Fix `composed_of` with symbol mapping.

    *Ryuta Kamizono*

*   Don't skip money's type cast for pluck and calculations.

    *Ryuta Kamizono*

*   Fix `where` on polymorphic association with non Active Record object.

    *Ryuta Kamizono*

*   Make sure `db:prepare` works even the schema file doesn't exist.

    *Rafael Mendonça França*

*   Fix complicated `has_many :through` with nested where condition.

    *Ryuta Kamizono*

*   Handle STI models for `has_many dependent: :destroy_async`.

    *Muhammad Usman*

*   Restore possibility of passing `false` to :polymorphic option of `belongs_to`.

    Previously, passing `false` would trigger the option validation logic
    to throw an error saying :polymorphic would not be a valid option.

    *glaszig*

*   Allow adding nonnamed expression indexes to be revertible.

    Fixes #40732.

    Previously, the following code would raise an error, when executed while rolling back,
    and the index name should be specified explicitly. Now, the index name is inferred
    automatically.

    ```ruby
    add_index(:items, "to_tsvector('english', description)")
    ```

    *fatkodima*


## Rails 6.1.0 (December 09, 2020) ##

*   Only warn about negative enums if a positive form that would cause conflicts exists.

    Fixes #39065.

    *Alex Ghiculescu*

*   Change `attribute_for_inspect` to take `filter_attributes` in consideration.

    *Rafael Mendonça França*

*   Fix odd behavior of inverse_of with multiple belongs_to to same class.

    Fixes #35204.

    *Tomoyuki Kai*

*   Build predicate conditions with objects that delegate `#id` and primary key:

    ```ruby
    class AdminAuthor
      delegate_missing_to :@author

      def initialize(author)
        @author = author
      end
    end

    Post.where(author: AdminAuthor.new(author))
    ```

    *Sean Doyle*

*   Add `connected_to_many` API.

    This API allows applications to connect to multiple databases at once without switching all of them or implementing a deeply nested stack.

    Before:

        AnimalsRecord.connected_to(role: :reading) do
          MealsRecord.connected_to(role: :reading) do
            Dog.first # read from animals replica
            Dinner.first # read from meals replica
            Person.first # read from primary writer
          end
        end

    After:

        ActiveRecord::Base.connected_to_many([AnimalsRecord, MealsRecord], role: :reading) do
          Dog.first # read from animals replica
          Dinner.first # read from meals replica
          Person.first # read from primary writer
        end

    *Eileen M. Uchitelle*, *John Crepezzi*

*   Add option to raise or log for `ActiveRecord::StrictLoadingViolationError`.

    Some applications may not want to raise an error in production if using `strict_loading`. This would allow an application to set strict loading to log for the production environment while still raising in development and test environments.

    Set `config.active_record.action_on_strict_loading_violation` to `:log` errors instead of raising.

    *Eileen M. Uchitelle*

*   Allow the inverse of a `has_one` association that was previously autosaved to be loaded.

    Fixes #34255.

    *Steven Weber*

*   Optimise the length of index names for polymorphic references by using the reference name rather than the type and id column names.

    Because the default behaviour when adding an index with multiple columns is to use all column names in the index name, this could frequently lead to overly long index names for polymorphic references which would fail the migration if it exceeded the database limit.

    This change reduces the chance of that happening by using the reference name, e.g. `index_my_table_on_my_reference`.

    Fixes #38655.

    *Luke Redpath*

*   MySQL: Uniqueness validator now respects default database collation,
    no longer enforce case sensitive comparison by default.

    *Ryuta Kamizono*

*   Remove deprecated methods from `ActiveRecord::ConnectionAdapters::DatabaseLimits`.

    `column_name_length`
    `table_name_length`
    `columns_per_table`
    `indexes_per_table`
    `columns_per_multicolumn_index`
    `sql_query_length`
    `joins_per_query`

    *Rafael Mendonça França*

*   Remove deprecated `ActiveRecord::ConnectionAdapters::AbstractAdapter#supports_multi_insert?`.

    *Rafael Mendonça França*

*   Remove deprecated `ActiveRecord::ConnectionAdapters::AbstractAdapter#supports_foreign_keys_in_create?`.

    *Rafael Mendonça França*

*   Remove deprecated `ActiveRecord::ConnectionAdapters::PostgreSQLAdapter#supports_ranges?`.

    *Rafael Mendonça França*

*   Remove deprecated `ActiveRecord::Base#update_attributes` and `ActiveRecord::Base#update_attributes!`.

    *Rafael Mendonça França*

*   Remove deprecated `migrations_path` argument in `ActiveRecord::ConnectionAdapter::SchemaStatements#assume_migrated_upto_version`.

    *Rafael Mendonça França*

*   Remove deprecated `config.active_record.sqlite3.represent_boolean_as_integer`.

    *Rafael Mendonça França*

*   `relation.create` does no longer leak scope to class level querying methods
    in initialization block and callbacks.

    Before:

        User.where(name: "John").create do |john|
          User.find_by(name: "David") # => nil
        end

    After:

        User.where(name: "John").create do |john|
          User.find_by(name: "David") # => #<User name: "David", ...>
        end

    *Ryuta Kamizono*

*   Named scope chain does no longer leak scope to class level querying methods.

        class User < ActiveRecord::Base
          scope :david, -> { User.where(name: "David") }
        end

    Before:

        User.where(name: "John").david
        # SELECT * FROM users WHERE name = 'John' AND name = 'David'

    After:

        User.where(name: "John").david
        # SELECT * FROM users WHERE name = 'David'

    *Ryuta Kamizono*

*   Remove deprecated methods from `ActiveRecord::DatabaseConfigurations`.

    `fetch`
    `each`
    `first`
    `values`
    `[]=`

    *Rafael Mendonça França*

*   `where.not` now generates NAND predicates instead of NOR.

     Before:

        User.where.not(name: "Jon", role: "admin")
        # SELECT * FROM users WHERE name != 'Jon' AND role != 'admin'

     After:

        User.where.not(name: "Jon", role: "admin")
        # SELECT * FROM users WHERE NOT (name == 'Jon' AND role == 'admin')

    *Rafael Mendonça França*

*   Remove deprecated `ActiveRecord::Result#to_hash` method.

    *Rafael Mendonça França*

*   Deprecate `ActiveRecord::Base.allow_unsafe_raw_sql`.

    *Rafael Mendonça França*

*   Remove deprecated support for using unsafe raw SQL in `ActiveRecord::Relation` methods.

    *Rafael Mendonça França*

*   Allow users to silence the "Rails couldn't infer whether you are using multiple databases..."
    message using `config.active_record.suppress_multiple_database_warning`.

    *Omri Gabay*

*   Connections can be granularly switched for abstract classes when `connected_to` is called.

    This change allows `connected_to` to switch a `role` and/or `shard` for a single abstract class instead of all classes globally. Applications that want to use the new feature need to set `config.active_record.legacy_connection_handling` to `false` in their application configuration.

    Example usage:

    Given an application we have a `User` model that inherits from `ApplicationRecord` and a `Dog` model that inherits from `AnimalsRecord`. `AnimalsRecord` and `ApplicationRecord` have writing and reading connections as well as shard `default`, `one`, and `two`.

    ```ruby
    ActiveRecord::Base.connected_to(role: :reading) do
      User.first # reads from default replica
      Dog.first # reads from default replica

      AnimalsRecord.connected_to(role: :writing, shard: :one) do
        User.first # reads from default replica
        Dog.first # reads from shard one primary
      end

      User.first # reads from default replica
      Dog.first # reads from default replica

      ApplicationRecord.connected_to(role: :writing, shard: :two) do
        User.first # reads from shard two primary
        Dog.first # reads from default replica
      end
    end
    ```

    *Eileen M. Uchitelle*, *John Crepezzi*

*   Allow double-dash comment syntax when querying read-only databases

    *James Adam*

*   Add `values_at` method.

    Returns an array containing the values associated with the given methods.

    ```ruby
    topic = Topic.first
    topic.values_at(:title, :author_name)
    # => ["Budget", "Jason"]
    ```

    Similar to `Hash#values_at` but on an Active Record instance.

    *Guillaume Briday*

*   Fix `read_attribute_before_type_cast` to consider attribute aliases.

    *Marcelo Lauxen*

*   Support passing record to uniqueness validator `:conditions` callable:

    ```ruby
    class Article < ApplicationRecord
      validates_uniqueness_of :title, conditions: ->(article) {
        published_at = article.published_at
        where(published_at: published_at.beginning_of_year..published_at.end_of_year)
      }
    end
    ```

    *Eliot Sykes*

*   `BatchEnumerator#update_all` and `BatchEnumerator#delete_all` now return the
    total number of rows affected, just like their non-batched counterparts.

    ```ruby
    Person.in_batches.update_all("first_name = 'Eugene'") # => 42
    Person.in_batches.delete_all # => 42
    ```

    Fixes #40287.

    *Eugene Kenny*

*   Add support for PostgreSQL `interval` data type with conversion to
    `ActiveSupport::Duration` when loading records from database and
    serialization to ISO 8601 formatted duration string on save.
    Add support to define a column in migrations and get it in a schema dump.
    Optional column precision is supported.

    To use this in 6.1, you need to place the next string to your model file:

        attribute :duration, :interval

    To keep old behavior until 6.2 is released:

        attribute :duration, :string

    Example:

        create_table :events do |t|
          t.string   :name
          t.interval :duration
        end

        class Event < ApplicationRecord
          attribute :duration, :interval
        end

        Event.create!(name: 'Rock Fest', duration: 2.days)
        Event.last.duration # => 2 days
        Event.last.duration.iso8601 # => "P2D"
        Event.new(duration: 'P1DT12H3S').duration # => 1 day, 12 hours, and 3 seconds
        Event.new(duration: '1 day') # Unknown value will be ignored and NULL will be written to database

    *Andrey Novikov*

*   Allow associations supporting the `dependent:` key to take `dependent: :destroy_async`.

    ```ruby
    class Account < ActiveRecord::Base
        belongs_to :supplier, dependent: :destroy_async
    end
    ```

    `:destroy_async` will enqueue a job to destroy associated records in the background.

    *DHH*, *George Claghorn*, *Cory Gwin*, *Rafael Mendonça França*, *Adrianna Chang*

*   Add `SKIP_TEST_DATABASE` environment variable to disable modifying the test database when `rails db:create` and `rails db:drop` are called.

    *Jason Schweier*

*   `connects_to` can only be called on `ActiveRecord::Base` or abstract classes.

    Ensure that `connects_to` can only be called from `ActiveRecord::Base` or abstract classes. This protects the application from opening duplicate or too many connections.

    *Eileen M. Uchitelle*, *John Crepezzi*

*   All connection adapters `execute` now raises `ActiveRecord::ConnectionNotEstablished` rather than
    `ActiveRecord::StatementInvalid` when they encounter a connection error.

    *Jean Boussier*

*   `Mysql2Adapter#quote_string` now raises `ActiveRecord::ConnectionNotEstablished` rather than
    `ActiveRecord::StatementInvalid` when it can't connect to the MySQL server.

    *Jean Boussier*

*   Add support for check constraints that are `NOT VALID` via `validate: false` (PostgreSQL-only).

    *Alex Robbin*

*   Ensure the default configuration is considered primary or first for an environment

    If a multiple database application provides a configuration named primary, that will be treated as default. In applications that do not have a primary entry, the default database configuration will be the first configuration for an environment.

    *Eileen M. Uchitelle*

*   Allow `where` references association names as joined table name aliases.

    ```ruby
    class Comment < ActiveRecord::Base
      enum label: [:default, :child]
      has_many :children, class_name: "Comment", foreign_key: :parent_id
    end

    # ... FROM comments LEFT OUTER JOIN comments children ON ... WHERE children.label = 1
    Comment.includes(:children).where("children.label": "child")
    ```

    *Ryuta Kamizono*

*   Support storing demodulized class name for polymorphic type.

    Before Rails 6.1, storing demodulized class name is supported only for STI type
    by `store_full_sti_class` class attribute.

    Now `store_full_class_name` class attribute can handle both STI and polymorphic types.

    *Ryuta Kamizono*

*   Deprecate `rails db:structure:{load, dump}` tasks and extend
    `rails db:schema:{load, dump}` tasks to work with either `:ruby` or `:sql` format,
    depending on `config.active_record.schema_format` configuration value.

    *fatkodima*

*   Respect the `select` values for eager loading.

    ```ruby
    post = Post.select("UPPER(title) AS title").first
    post.title # => "WELCOME TO THE WEBLOG"
    post.body  # => ActiveModel::MissingAttributeError

    # Rails 6.0 (ignore the `select` values)
    post = Post.select("UPPER(title) AS title").eager_load(:comments).first
    post.title # => "Welcome to the weblog"
    post.body  # => "Such a lovely day"

    # Rails 6.1 (respect the `select` values)
    post = Post.select("UPPER(title) AS title").eager_load(:comments).first
    post.title # => "WELCOME TO THE WEBLOG"
    post.body  # => ActiveModel::MissingAttributeError
    ```

    *Ryuta Kamizono*

*   Allow attribute's default to be configured but keeping its own type.

    ```ruby
    class Post < ActiveRecord::Base
      attribute :written_at, default: -> { Time.now.utc }
    end

    # Rails 6.0
    Post.type_for_attribute(:written_at) # => #<Type::Value ... precision: nil, ...>

    # Rails 6.1
    Post.type_for_attribute(:written_at) # => #<Type::DateTime ... precision: 6, ...>
    ```

    *Ryuta Kamizono*

*   Allow default to be configured for Enum.

    ```ruby
    class Book < ActiveRecord::Base
      enum status: [:proposed, :written, :published], _default: :published
    end

    Book.new.status # => "published"
    ```

    *Ryuta Kamizono*

*   Deprecate YAML loading from legacy format older than Rails 5.0.

    *Ryuta Kamizono*

*   Added the setting `ActiveRecord::Base.immutable_strings_by_default`, which
    allows you to specify that all string columns should be frozen unless
    otherwise specified. This will reduce memory pressure for applications which
    do not generally mutate string properties of Active Record objects.

    *Sean Griffin*, *Ryuta Kamizono*

*   Deprecate `map!` and `collect!` on `ActiveRecord::Result`.

    *Ryuta Kamizono*

*   Support `relation.and` for intersection as Set theory.

    ```ruby
    david_and_mary = Author.where(id: [david, mary])
    mary_and_bob   = Author.where(id: [mary, bob])

    david_and_mary.merge(mary_and_bob) # => [mary, bob]

    david_and_mary.and(mary_and_bob) # => [mary]
    david_and_mary.or(mary_and_bob)  # => [david, mary, bob]
    ```

    *Ryuta Kamizono*

*   Merging conditions on the same column no longer maintain both conditions,
    and will be consistently replaced by the latter condition in Rails 6.2.
    To migrate to Rails 6.2's behavior, use `relation.merge(other, rewhere: true)`.

    ```ruby
    # Rails 6.1 (IN clause is replaced by merger side equality condition)
    Author.where(id: [david.id, mary.id]).merge(Author.where(id: bob)) # => [bob]

    # Rails 6.1 (both conflict conditions exists, deprecated)
    Author.where(id: david.id..mary.id).merge(Author.where(id: bob)) # => []

    # Rails 6.1 with rewhere to migrate to Rails 6.2's behavior
    Author.where(id: david.id..mary.id).merge(Author.where(id: bob), rewhere: true) # => [bob]

    # Rails 6.2 (same behavior with IN clause, mergee side condition is consistently replaced)
    Author.where(id: [david.id, mary.id]).merge(Author.where(id: bob)) # => [bob]
    Author.where(id: david.id..mary.id).merge(Author.where(id: bob)) # => [bob]
    ```

    *Ryuta Kamizono*

*   Do not mark Postgresql MAC address and UUID attributes as changed when the assigned value only varies by case.

    *Peter Fry*

*   Resolve issue with insert_all unique_by option when used with expression index.

    When the `:unique_by` option of `ActiveRecord::Persistence.insert_all` and
    `ActiveRecord::Persistence.upsert_all` was used with the name of an expression index, an error
    was raised. Adding a guard around the formatting behavior for the `:unique_by` corrects this.

    Usage:

    ```ruby
    create_table :books, id: :integer, force: true do |t|
      t.column :name, :string
      t.index "lower(name)", unique: true
    end

    Book.insert_all [{ name: "MyTest" }], unique_by: :index_books_on_lower_name
    ```

    Fixes #39516.

    *Austen Madden*

*   Add basic support for CHECK constraints to database migrations.

    Usage:

    ```ruby
    add_check_constraint :products, "price > 0", name: "price_check"
    remove_check_constraint :products, name: "price_check"
    ```

    *fatkodima*

*   Add `ActiveRecord::Base.strict_loading_by_default` and `ActiveRecord::Base.strict_loading_by_default=`
    to enable/disable strict_loading mode by default for a model. The configuration's value is
    inheritable by subclasses, but they can override that value and it will not impact parent class.

    Usage:

    ```ruby
    class Developer < ApplicationRecord
      self.strict_loading_by_default = true

      has_many :projects
    end

    dev = Developer.first
    dev.projects.first
    # => ActiveRecord::StrictLoadingViolationError Exception: Developer is marked as strict_loading and Project cannot be lazily loaded.
    ```

    *bogdanvlviv*

*   Deprecate passing an Active Record object to `quote`/`type_cast` directly.

    *Ryuta Kamizono*

*   Default engine `ENGINE=InnoDB` is no longer dumped to make schema more agnostic.

    Before:

    ```ruby
    create_table "accounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    end
    ```

    After:

    ```ruby
    create_table "accounts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    end
    ```

    *Ryuta Kamizono*

*   Added delegated type as an alternative to single-table inheritance for representing class hierarchies.
    See ActiveRecord::DelegatedType for the full description.

    *DHH*

*   Deprecate aggregations with group by duplicated fields.

    To migrate to Rails 6.2's behavior, use `uniq!(:group)` to deduplicate group fields.

    ```ruby
    accounts = Account.group(:firm_id)

    # duplicated group fields, deprecated.
    accounts.merge(accounts.where.not(credit_limit: nil)).sum(:credit_limit)
    # => {
    #   [1, 1] => 50,
    #   [2, 2] => 60
    # }

    # use `uniq!(:group)` to deduplicate group fields.
    accounts.merge(accounts.where.not(credit_limit: nil)).uniq!(:group).sum(:credit_limit)
    # => {
    #   1 => 50,
    #   2 => 60
    # }
    ```

    *Ryuta Kamizono*

*   Deprecate duplicated query annotations.

    To migrate to Rails 6.2's behavior, use `uniq!(:annotate)` to deduplicate query annotations.

    ```ruby
    accounts = Account.where(id: [1, 2]).annotate("david and mary")

    # duplicated annotations, deprecated.
    accounts.merge(accounts.rewhere(id: 3))
    # SELECT accounts.* FROM accounts WHERE accounts.id = 3 /* david and mary */ /* david and mary */

    # use `uniq!(:annotate)` to deduplicate annotations.
    accounts.merge(accounts.rewhere(id: 3)).uniq!(:annotate)
    # SELECT accounts.* FROM accounts WHERE accounts.id = 3 /* david and mary */
    ```

    *Ryuta Kamizono*

*   Resolve conflict between counter cache and optimistic locking.

    Bump an Active Record instance's lock version after updating its counter
    cache. This avoids raising an unnecessary `ActiveRecord::StaleObjectError`
    upon subsequent transactions by maintaining parity with the corresponding
    database record's `lock_version` column.

    Fixes #16449.

    *Aaron Lipman*

*   Support merging option `:rewhere` to allow mergee side condition to be replaced exactly.

    ```ruby
    david_and_mary = Author.where(id: david.id..mary.id)

    # both conflict conditions exists
    david_and_mary.merge(Author.where(id: bob)) # => []

    # mergee side condition is replaced by rewhere
    david_and_mary.merge(Author.rewhere(id: bob)) # => [bob]

    # mergee side condition is replaced by rewhere option
    david_and_mary.merge(Author.where(id: bob), rewhere: true) # => [bob]
    ```

    *Ryuta Kamizono*

*   Add support for finding records based on signed ids, which are tamper-proof, verified ids that can be
    set to expire and scoped with a purpose. This is particularly useful for things like password reset
    or email verification, where you want the bearer of the signed id to be able to interact with the
    underlying record, but usually only within a certain time period.

    ```ruby
    signed_id = User.first.signed_id expires_in: 15.minutes, purpose: :password_reset

    User.find_signed signed_id # => nil, since the purpose does not match

    travel 16.minutes
    User.find_signed signed_id, purpose: :password_reset # => nil, since the signed id has expired

    travel_back
    User.find_signed signed_id, purpose: :password_reset # => User.first

    User.find_signed! "bad data" # => ActiveSupport::MessageVerifier::InvalidSignature
    ```

    *DHH*

*   Support `ALGORITHM = INSTANT` DDL option for index operations on MySQL.

    *Ryuta Kamizono*

*   Fix index creation to preserve index comment in bulk change table on MySQL.

    *Ryuta Kamizono*

*   Allow `unscope` to be aware of table name qualified values.

    It is possible to unscope only the column in the specified table.

    ```ruby
    posts = Post.joins(:comments).group(:"posts.hidden")
    posts = posts.where("posts.hidden": false, "comments.hidden": false)

    posts.count
    # => { false => 10 }

    # unscope both hidden columns
    posts.unscope(where: :hidden).count
    # => { false => 11, true => 1 }

    # unscope only comments.hidden column
    posts.unscope(where: :"comments.hidden").count
    # => { false => 11 }
    ```

    *Ryuta Kamizono*, *Slava Korolev*

*   Fix `rewhere` to truly overwrite collided where clause by new where clause.

    ```ruby
    steve = Person.find_by(name: "Steve")
    david = Author.find_by(name: "David")

    relation = Essay.where(writer: steve)

    # Before
    relation.rewhere(writer: david).to_a # => []

    # After
    relation.rewhere(writer: david).to_a # => [david]
    ```

    *Ryuta Kamizono*

*   Inspect time attributes with subsec and time zone offset.

    ```ruby
    p Knot.create
    => #<Knot id: 1, created_at: "2016-05-05 01:29:47.116928000 +0000">
    ```

    *akinomaeni*, *Jonathan Hefner*

*   Deprecate passing a column to `type_cast`.

    *Ryuta Kamizono*

*   Deprecate `in_clause_length` and `allowed_index_name_length` in `DatabaseLimits`.

    *Ryuta Kamizono*

*   Support bulk insert/upsert on relation to preserve scope values.

    *Josef Šimánek*, *Ryuta Kamizono*

*   Preserve column comment value on changing column name on MySQL.

    *Islam Taha*

*   Add support for `if_exists` option for removing an index.

    The `remove_index` method can take an `if_exists` option. If this is set to true an error won't be raised if the index doesn't exist.

    *Eileen M. Uchitelle*

*   Remove ibm_db, informix, mssql, oracle, and oracle12 Arel visitors which are not used in the code base.

    *Ryuta Kamizono*

*   Prevent `build_association` from `touching` a parent record if the record isn't persisted for `has_one` associations.

    Fixes #38219.

    *Josh Brody*

*   Add support for `if_not_exists` option for adding index.

    The `add_index` method respects `if_not_exists` option. If it is set to true
    index won't be added.

    Usage:

    ```ruby
      add_index :users, :account_id, if_not_exists: true
    ```

    The `if_not_exists` option passed to `create_table` also gets propagated to indexes
    created within that migration so that if table and its indexes exist then there is no
    attempt to create them again.

    *Prathamesh Sonpatki*

*   Add `ActiveRecord::Base#previously_new_record?` to show if a record was new before the last save.

    *Tom Ward*

*   Support descending order for `find_each`, `find_in_batches`, and `in_batches`.

    Batch processing methods allow you to work with the records in batches, greatly reducing memory consumption, but records are always batched from oldest id to newest.

    This change allows reversing the order, batching from newest to oldest. This is useful when you need to process newer batches of records first.

    Pass `order: :desc` to yield batches in descending order. The default remains `order: :asc`.

    ```ruby
    Person.find_each(order: :desc) do |person|
      person.party_all_night!
    end
    ```

    *Alexey Vasiliev*

*   Fix `insert_all` with enum values.

    Fixes #38716.

    *Joel Blum*

*   Add support for `db:rollback:name` for multiple database applications.

    Multiple database applications will now raise if `db:rollback` is call and recommend using the `db:rollback:[NAME]` to rollback migrations.

    *Eileen M. Uchitelle*

*   `Relation#pick` now uses already loaded results instead of making another query.

    *Eugene Kenny*

*   Deprecate using `return`, `break` or `throw` to exit a transaction block after writes.

    *Dylan Thacker-Smith*

*   Dump the schema or structure of a database when calling `db:migrate:name`.

    In previous versions of Rails, `rails db:migrate` would dump the schema of the database. In Rails 6, that holds true (`rails db:migrate` dumps all databases' schemas), but `rails db:migrate:name` does not share that behavior.

    Going forward, calls to `rails db:migrate:name` will dump the schema (or structure) of the database being migrated.

    *Kyle Thompson*

*   Reset the `ActiveRecord::Base` connection after `rails db:migrate:name`.

    When `rails db:migrate` has finished, it ensures the `ActiveRecord::Base` connection is reset to its original configuration. Going forward, `rails db:migrate:name` will have the same behavior.

    *Kyle Thompson*

*   Disallow calling `connected_to` on subclasses of `ActiveRecord::Base`.

    Behavior has not changed here but the previous API could be misleading to people who thought it would switch connections for only that class. `connected_to` switches the context from which we are getting connections, not the connections themselves.

    *Eileen M. Uchitelle*, *John Crepezzi*

*   Add support for horizontal sharding to `connects_to` and `connected_to`.

    Applications can now connect to multiple shards and switch between their shards in an application. Note that the shard swapping is still a manual process as this change does not include an API for automatic shard swapping.

    Usage:

    Given the following configuration:

    ```yaml
    # config/database.yml
    production:
      primary:
        database: my_database
      primary_shard_one:
        database: my_database_shard_one
    ```

    Connect to multiple shards:

    ```ruby
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true

      connects_to shards: {
        default: { writing: :primary },
        shard_one: { writing: :primary_shard_one }
      }
    ```

    Swap between shards in your controller / model code:

    ```ruby
    ActiveRecord::Base.connected_to(shard: :shard_one) do
      # Read from shard one
    end
    ```

    The horizontal sharding API also supports read replicas. See guides for more details.

    *Eileen M. Uchitelle*, *John Crepezzi*

*   Deprecate `spec_name` in favor of `name` on database configurations.

    The accessors for `spec_name` on `configs_for` and `DatabaseConfig` are deprecated. Please use `name` instead.

    Deprecated behavior:

    ```ruby
    db_config = ActiveRecord::Base.configs_for(env_name: "development", spec_name: "primary")
    db_config.spec_name
    ```

    New behavior:

    ```ruby
    db_config = ActiveRecord::Base.configs_for(env_name: "development", name: "primary")
    db_config.name
    ```

    *Eileen M. Uchitelle*

*   Add additional database-specific rake tasks for multi-database users.

    Previously, `rails db:create`, `rails db:drop`, and `rails db:migrate` were the only rails tasks that could operate on a single
    database. For example:

    ```
    rails db:create
    rails db:create:primary
    rails db:create:animals
    rails db:drop
    rails db:drop:primary
    rails db:drop:animals
    rails db:migrate
    rails db:migrate:primary
    rails db:migrate:animals
    ```

    With these changes, `rails db:schema:dump`, `rails db:schema:load`, `rails db:structure:dump`, `rails db:structure:load` and
    `rails db:test:prepare` can additionally operate on a single database. For example:

    ```
    rails db:schema:dump
    rails db:schema:dump:primary
    rails db:schema:dump:animals
    rails db:schema:load
    rails db:schema:load:primary
    rails db:schema:load:animals
    rails db:structure:dump
    rails db:structure:dump:primary
    rails db:structure:dump:animals
    rails db:structure:load
    rails db:structure:load:primary
    rails db:structure:load:animals
    rails db:test:prepare
    rails db:test:prepare:primary
    rails db:test:prepare:animals
    ```

    *Kyle Thompson*

*   Add support for `strict_loading` mode on association declarations.

    Raise an error if attempting to load a record from an association that has been marked as `strict_loading` unless it was explicitly eager loaded.

    Usage:

    ```ruby
    class Developer < ApplicationRecord
      has_many :projects, strict_loading: true
    end

    dev = Developer.first
    dev.projects.first
    # => ActiveRecord::StrictLoadingViolationError: The projects association is marked as strict_loading and cannot be lazily loaded.
    ```

    *Kevin Deisz*

*   Add support for `strict_loading` mode to prevent lazy loading of records.

    Raise an error if a parent record is marked as `strict_loading` and attempts to lazily load its associations. This is useful for finding places you may want to preload an association and avoid additional queries.

    Usage:

    ```ruby
    dev = Developer.strict_loading.first
    dev.audit_logs.to_a
    # => ActiveRecord::StrictLoadingViolationError: Developer is marked as strict_loading and AuditLog cannot be lazily loaded.
    ```

    *Eileen M. Uchitelle*, *Aaron Patterson*

*   Add support for PostgreSQL 11+ partitioned indexes when using `upsert_all`.

    *Sebastián Palma*

*   Adds support for `if_not_exists` to `add_column` and `if_exists` to `remove_column`.

    Applications can set their migrations to ignore exceptions raised when adding a column that already exists or when removing a column that does not exist.

    Example Usage:

    ```ruby
    class AddColumnTitle < ActiveRecord::Migration[6.1]
      def change
        add_column :posts, :title, :string, if_not_exists: true
      end
    end
    ```

    ```ruby
    class RemoveColumnTitle < ActiveRecord::Migration[6.1]
      def change
        remove_column :posts, :title, if_exists: true
      end
    end
    ```

    *Eileen M. Uchitelle*

*   Regexp-escape table name for MS SQL Server.

    Add `Regexp.escape` to one method in ActiveRecord, so that table names with regular expression characters in them work as expected. Since MS SQL Server uses "[" and "]" to quote table and column names, and those characters are regular expression characters, methods like `pluck` and `select` fail in certain cases when used with the MS SQL Server adapter.

    *Larry Reid*

*   Store advisory locks on their own named connection.

    Previously advisory locks were taken out against a connection when a migration started. This works fine in single database applications but doesn't work well when migrations need to open new connections which results in the lock getting dropped.

    In order to fix this we are storing the advisory lock on a new connection with the connection specification name `AdvisoryLockBase`. The caveat is that we need to maintain at least 2 connections to a database while migrations are running in order to do this.

    *Eileen M. Uchitelle*, *John Crepezzi*

*   Allow schema cache path to be defined in the database configuration file.

    For example:

    ```yaml
    development:
      adapter: postgresql
      database: blog_development
      pool: 5
      schema_cache_path: tmp/schema/main.yml
    ```

    *Katrina Owen*

*   Deprecate `#remove_connection` in favor of `#remove_connection_pool` when called on the handler.

    `#remove_connection` is deprecated in order to support returning a `DatabaseConfig` object instead of a `Hash`. Use `#remove_connection_pool`, `#remove_connection` will be removed in 6.2.

    *Eileen M. Uchitelle*, *John Crepezzi*

*   Deprecate `#default_hash` and it's alias `#[]` on database configurations.

    Applications should use `configs_for`. `#default_hash` and `#[]` will be removed in 6.2.

    *Eileen M. Uchitelle*, *John Crepezzi*

*   Add scale support to `ActiveRecord::Validations::NumericalityValidator`.

    *Gannon McGibbon*

*   Find orphans by looking for missing relations through chaining `where.missing`:

    Before:

    ```ruby
    Post.left_joins(:author).where(authors: { id: nil })
    ```

    After:

    ```ruby
    Post.where.missing(:author)
    ```

    *Tom Rossi*

*   Ensure `:reading` connections always raise if a write is attempted.

    Now Rails will raise an `ActiveRecord::ReadOnlyError` if any connection on the reading handler attempts to make a write. If your reading role needs to write you should name the role something other than `:reading`.

    *Eileen M. Uchitelle*

*   Deprecate `"primary"` as the `connection_specification_name` for `ActiveRecord::Base`.

    `"primary"` has been deprecated as the `connection_specification_name` for `ActiveRecord::Base` in favor of using `"ActiveRecord::Base"`. This change affects calls to `ActiveRecord::Base.connection_handler.retrieve_connection` and `ActiveRecord::Base.connection_handler.remove_connection`. If you're calling these methods with `"primary"`, please switch to `"ActiveRecord::Base"`.

    *Eileen M. Uchitelle*, *John Crepezzi*

*   Add `ActiveRecord::Validations::NumericalityValidator` with
    support for casting floats using a database columns' precision value.

    *Gannon McGibbon*

*   Enforce fresh ETag header after a collection's contents change by adding
    ActiveRecord::Relation#cache_key_with_version. This method will be used by
    ActionController::ConditionalGet to ensure that when collection cache versioning
    is enabled, requests using ConditionalGet don't return the same ETag header
    after a collection is modified.

    Fixes #38078.

    *Aaron Lipman*

*   Skip test database when running `db:create` or `db:drop` in development
    with `DATABASE_URL` set.

    *Brian Buchalter*

*   Don't allow mutations on the database configurations hash.

    Freeze the configurations hash to disallow directly changing it. If applications need to change the hash, for example to create databases for parallelization, they should use the `DatabaseConfig` object directly.

    Before:

    ```ruby
    @db_config = ActiveRecord::Base.configurations.configs_for(env_name: "test", spec_name: "primary")
    @db_config.configuration_hash.merge!(idle_timeout: "0.02")
    ```

    After:

    ```ruby
    @db_config = ActiveRecord::Base.configurations.configs_for(env_name: "test", spec_name: "primary")
    config = @db_config.configuration_hash.merge(idle_timeout: "0.02")
    db_config = ActiveRecord::DatabaseConfigurations::HashConfig.new(@db_config.env_name, @db_config.spec_name, config)
    ```

    *Eileen M. Uchitelle*, *John Crepezzi*

*   Remove `:connection_id` from the `sql.active_record` notification.

    *Aaron Patterson*, *Rafael Mendonça França*

*   The `:name` key will no longer be returned as part of `DatabaseConfig#configuration_hash`. Please use `DatabaseConfig#owner_name` instead.

    *Eileen M. Uchitelle*, *John Crepezzi*

*   ActiveRecord's `belongs_to_required_by_default` flag can now be set per model.

    You can now opt-out/opt-in specific models from having their associations required
    by default.

    This change is meant to ease the process of migrating all your models to have
    their association required.

    *Edouard Chin*

*   The `connection_config` method has been deprecated, please use `connection_db_config` instead which will return a `DatabaseConfigurations::DatabaseConfig` instead of a `Hash`.

    *Eileen M. Uchitelle*, *John Crepezzi*

*   Retain explicit selections on the base model after applying `includes` and `joins`.

    Resolves #34889.

    *Patrick Rebsch*

*   The `database` kwarg is deprecated without replacement because it can't be used for sharding and creates an issue if it's used during a request. Applications that need to create new connections should use `connects_to` instead.

    *Eileen M. Uchitelle*, *John Crepezzi*

*   Allow attributes to be fetched from Arel node groupings.

    *Jeff Emminger*, *Gannon McGibbon*

*   A database URL can now contain a querystring value that contains an equal sign. This is needed to support passing PostgreSQL `options`.

    *Joshua Flanagan*

*   Calling methods like `establish_connection` with a `Hash` which is invalid (eg: no `adapter`) will now raise an error the same way as connections defined in `config/database.yml`.

    *John Crepezzi*

*   Specifying `implicit_order_column` now subsorts the records by primary key if available to ensure deterministic results.

    *Paweł Urbanek*

*   `where(attr => [])` now loads an empty result without making a query.

    *John Hawthorn*

*   Fixed the performance regression for `primary_keys` introduced MySQL 8.0.

    *Hiroyuki Ishii*

*   Add support for `belongs_to` to `has_many` inversing.

    *Gannon McGibbon*

*   Allow length configuration for `has_secure_token` method. The minimum length
    is set at 24 characters.

    Before:

    ```ruby
    has_secure_token :auth_token
    ```

    After:

    ```ruby
    has_secure_token :default_token             # 24 characters
    has_secure_token :auth_token, length: 36    # 36 characters
    has_secure_token :invalid_token, length: 12 # => ActiveRecord::SecureToken::MinimumLengthError
    ```

    *Bernardo de Araujo*

*   Deprecate `DatabaseConfigurations#to_h`. These connection hashes are still available via `ActiveRecord::Base.configurations.configs_for`.

    *Eileen Uchitelle*, *John Crepezzi*

*   Add `DatabaseConfig#configuration_hash` to return database configuration hashes with symbol keys, and use all symbol-key configuration hashes internally. Deprecate `DatabaseConfig#config` which returns a String-keyed `Hash` with the same values.

    *John Crepezzi*, *Eileen Uchitelle*

*   Allow column names to be passed to `remove_index` positionally along with other options.

    Passing other options can be necessary to make `remove_index` correctly reversible.

    Before:

        add_index    :reports, :report_id               # => works
        add_index    :reports, :report_id, unique: true # => works
        remove_index :reports, :report_id               # => works
        remove_index :reports, :report_id, unique: true # => ArgumentError

    After:

        remove_index :reports, :report_id, unique: true # => works

    *Eugene Kenny*

*   Allow bulk `ALTER` statements to drop and recreate indexes with the same name.

    *Eugene Kenny*

*   `insert`, `insert_all`, `upsert`, and `upsert_all` now clear the query cache.

    *Eugene Kenny*

*   Call `while_preventing_writes` directly from `connected_to`.

    In some cases application authors want to use the database switching middleware and make explicit calls with `connected_to`. It's possible for an app to turn off writes and not turn them back on by the time we call `connected_to(role: :writing)`.

    This change allows apps to fix this by assuming if a role is writing we want to allow writes, except in the case it's explicitly turned off.

    *Eileen M. Uchitelle*

*   Improve detection of ActiveRecord::StatementTimeout with mysql2 adapter in the edge case when the query is terminated during filesort.

    *Kir Shatrov*

*   Stop trying to read yaml file fixtures when loading Active Record fixtures.

    *Gannon McGibbon*

*   Deprecate `.reorder(nil)` with `.first` / `.first!` taking non-deterministic result.

    To continue taking non-deterministic result, use `.take` / `.take!` instead.

    *Ryuta Kamizono*

*   Preserve user supplied joins order as much as possible.

    Fixes #36761, #34328, #24281, #12953.

    *Ryuta Kamizono*

*   Allow `matches_regex` and `does_not_match_regexp` on the MySQL Arel visitor.

    *James Pearson*

*   Allow specifying fixtures to be ignored by setting `ignore` in YAML file's '_fixture' section.

    *Tongfei Gao*

*   Make the DATABASE_URL env variable only affect the primary connection. Add new env variables for multiple databases.

    *John Crepezzi*, *Eileen Uchitelle*

*   Add a warning for enum elements with 'not_' prefix.

        class Foo
          enum status: [:sent, :not_sent]
        end

    *Edu Depetris*

*   Make currency symbols optional for money column type in PostgreSQL.

    *Joel Schneider*

*   Add support for beginless ranges, introduced in Ruby 2.7.

    *Josh Goodall*

*   Add `database_exists?` method to connection adapters to check if a database exists.

    *Guilherme Mansur*

*   Loading the schema for a model that has no `table_name` raises a `TableNotSpecified` error.

    *Guilherme Mansur*, *Eugene Kenny*

*   PostgreSQL: Fix GROUP BY with ORDER BY virtual count attribute.

    Fixes #36022.

    *Ryuta Kamizono*

*   Make ActiveRecord `ConnectionPool.connections` method thread-safe.

    Fixes #36465.

    *Jeff Doering*

*   Add support for multiple databases to `rails db:abort_if_pending_migrations`.

    *Mark Lee*

*   Fix sqlite3 collation parsing when using decimal columns.

    *Martin R. Schuster*

*   Fix invalid schema when primary key column has a comment.

    Fixes #29966.

    *Guilherme Goettems Schneider*

*   Fix table comment also being applied to the primary key column.

    *Guilherme Goettems Schneider*

*   Allow generated `create_table` migrations to include or skip timestamps.

    *Michael Duchemin*


Please check [6-0-stable](https://github.com/rails/rails/blob/6-0-stable/activerecord/CHANGELOG.md) for previous changes.
