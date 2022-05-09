expect = require 'expect.js'
axios = require 'axios'

host = process.env.HOST or '127.0.0.1'
port = process.env.PORT or 3000

describe 'Perform and end to end test', ->

  it 'should return an empty array', ->
    # { status } = await axios.delete "http://#{host}:#{port}/drinks"
    { data } = await axios.get "http://#{host}:#{port}/drinks"
    expect status
      .to.be 200
    expect data
      .to.be '[]'
