/* global Vue, VueRouter, axios */

//Recipes Components

var RecipesIndexPage = {
  template: "#recipes-index-page",
  data: function() {
    return {
      recipes: []
    };
  },
  created: function() {
    axios.get("/recipes").then(function(response) {
      this.recipes = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var RecipesNewPage = {
  template: "#recipes-new-page",
  data: function() {
    return {
      title: "",
      ingredients: "",
      directions: "",
      prepTime: "",
      imageUrl: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        title: this.title,
        ingredients: this.ingredients,
        directions: this.directions,
        prep_time: this.prepTime,
        image_url: this.imageUrl
      };
      axios
        .post("/recipes", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            if (error.response.status === 401) {
              router.push("/login");
            } else if (error.response.status === 422) {
              this.errors = error.response.data.errors;
            } else {
              router.push("/");
            }

          }.bind(this)
        );
    }
  }
};

var RecipesShowPage = {
  template: "#recipes-show-page",
  data: function() {
    return {
      recipe: {
        formatted: {}
      }
    };
  },
  created: function() {
    axios.get("/recipes/" + this.$route.params.id)
    .then(function(response) {
      this.recipe = response.data;
    }.bind(this));
  }
};

var RecipesEditPage = {
  template: "#recipes-edit-page",
  data: function() {
    return {
      title: "",
      ingredients: "",
      directions: "",
      prepTime: "",
      imageUrl: "",
      errors: []
    };
  },
  created: function() {
    axios
      .get("/recipes/" + this.$route.params.id)
      .then(function(response) {
        console.log(response.data);
        var recipe = response.data;
        this.title = recipe.title;
        this.ingredients = recipe.ingredients;
        this.directions = recipe.directions;
        this.prepTime = recipe.prep_time;
        this.imageUrl = recipe.image_url;
      }.bind(this));
  },
  methods: {
    submit: function() {
      var params = {
        title: this.title,
        ingredients: this.ingredients,
        directions: this.direction,
        prep_time: this.prepTime,
        image_url: this.imageUrl
      };
      axios
        .patch("/recipes/" + this.$route.params.id, params)
        .then(function(response) {
          router.push("/recipes/" + this.$route.params.id);
        }.bind(this))
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
            router.push("/login");
          }.bind(this)
        );
    }
  }
};

var RecipesDestroyPage = {
  created: function() {
    axios.delete("/recipes/" + this.$route.params.id)
    .then(function(response) {
      router.push("/");
    }.bind(this));
  }
}

//Authorization Components

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};


var router = new VueRouter({
  routes: [{ path: "/", component: RecipesIndexPage },
           { path: "/recipes", component: RecipesIndexPage },
           { path: '/recipes/new', component: RecipesNewPage},
           { path: '/recipes/:id', component: RecipesShowPage},
           { path: '/recipes/:id/edit', component: RecipesEditPage},
           {path: '/recipes/:id/delete', component: RecipesDestroyPage},
           { path: '/signup', component: SignupPage },
           { path: '/login', component: LoginPage },
           { path: '/logout', component: LogoutPage }],
          
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});