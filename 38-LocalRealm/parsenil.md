func parseRepository(json: JSONDictionary) -> Repository? {
    guard let id = json["id"] as? Int else {
        print("Couldn't convert id to an Int")
        return nil
    }
    // TODO: parse the rest of the JSON...
    return Repository(id: id)
}
