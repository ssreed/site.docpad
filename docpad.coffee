# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
    plugins:
        ghpages:
            deployRemote: 'target'
            deployBranch: 'master'
    
    templateData:
        site:
            title: "Meet Sri"

        # Helpers

        #adds titles as h1
        getPreparedTitle: -> if @document.title then "#{@document.title} | #{@site.title}" else @site.title

        #adds dates
        postDate: (date, format="YYYY-MM-DD") -> return @moment(date).format(format)

    collections:
        pages: ->
            @getCollection('documents').findAllLive({isPage:true},[navOrder:1]).on "add", (model) ->
                model.setMetaDefaults({layout:"default"})

        posts: ->
            @getCollection('documents').findAllLive({relativeDirPath:'posts'},[date:-1])
}

# Export the DocPad Configuration
module.exports = docpadConfig