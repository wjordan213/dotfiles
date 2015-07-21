def ctc(arg)
  IO.popen("pbcopy", "w") { |pipe| pipe.puts arg }
end

def pp_ctc(arg)
  IO.popen("pbcopy", "w") { |pipe| pipe.pp arg }
end

def get_cc(name)
  ClientCompany.where("name LIKE '%#{name}%'")
end

def get_fcc(name)
  ClientCompany.where("name LIKE '%#{name}%'").first
end

def last_import(name)
  get_fcc(name).portfolio_imports.order(:created_at).last
end

def last_import_date(name)
  last_import(name).created_at
end

def last_import_data(name)
  ctc(last_import(name).import_data)
end


