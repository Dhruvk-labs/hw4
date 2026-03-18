Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })

  get("/login", { :controller => "sessions", :action => "new" })
  post("/sessions", { :controller => "sessions", :action => "create" })
  get("/logout", { :controller => "sessions", :action => "destroy" })

  get("/signup", { :controller => "users", :action => "new" })
  post("/users", { :controller => "users", :action => "create" })

  get("/places", { :controller => "places", :action => "index" })
  get("/places/new", { :controller => "places", :action => "new" })
  post("/places", { :controller => "places", :action => "create" })
  get("/places/:id", { :controller => "places", :action => "show" })

  get("/entries/new", { :controller => "entries", :action => "new" })
  post("/entries", { :controller => "entries", :action => "create" })
end
