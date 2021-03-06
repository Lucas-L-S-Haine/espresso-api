import { ObjectId } from 'mongodb'
import { parseValue } from 'query-types'
import db from './connection.js'

class Model
    constructor: (@collection, @db = db) ->

    create: (document) ->
        table = @collection
        result = await @db
            .then (conn) ->
                conn
                    .collection table
                    .insertOne document
        result

    read: (query) ->
        table = @collection
        result = await @db
            .then (conn) ->
                conn
                    .collection table
                    .find parseValue query
                    .toArray()
        result

    readOne: (id) ->
        table = @collection
        result = await @db
            .then (conn) ->
                conn
                    .collection table
                    .findOne new ObjectId id
        result

    update: (id, document) ->
        table = @collection
        result = await @db
            .then (conn) ->
                conn
                    .collection table
                    .findOneAndUpdate { _id: new ObjectId id },
                        $set: document,
                        { returnDocument: 'after' }
        result

    delete: (id) ->
        table = @collection
        result = await @db
            .then (conn) ->
                conn
                    .collection table
                    .deleteOne { _id: new ObjectId id }
        result


export default Model
