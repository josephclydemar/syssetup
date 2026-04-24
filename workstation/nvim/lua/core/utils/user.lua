function Hello()
  for i=1,10 do
    print("Hello, World!! -> ", i)
  end
  vim.defer_fn(function()
    vim.cmd("echo 'You selected: '")
  end, 2)
end

function MyInput()
  vim.ui.input({ prompt = "Enter session name: " }, function (input)
    print("Hello " .. input)
    Hello()
  end)
end

