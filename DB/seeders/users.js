exports.seed = function(knex) {
    // Deletes ALL existing entries
    return knex('users').del()
      .then(function () {
        // Inserts seed entries
        return knex('users').insert([
          { id: 1, first_name: 'prasath' , last_name:"m" },
          { id: 2, first_name: 'prem' , last_name:"m"},
          { id: 3, first_name: 'demo' , last_name:"m"}
        ]);
      });
  };
  