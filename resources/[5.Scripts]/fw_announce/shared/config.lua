Config                            = {}

Config.Context = false
Config.Position = 'top-right' -- 'top-left' or 'top-right' or 'bottom-left' or 'bottom-right'

Config.Announce = {
    ['mechanic'] = {
        ['Open'] = {
            id                              = 'mechanic_open',
            title                           = "Informations",
            description                     = "Ouvert",
            position                        = 'top',
            style = {
                backgroundColor             = '#000000',
                color                       = '#ffffff'
            },
            icon                            = 'box',
            type                            = 'error',
            iconColor                       = '#FFFFFF'
        },
        ['Close'] = {
            id                              = 'mechanic_close',
            title                           = "Informations",
            description                     = "Fermer",
            position                        = 'top',
            style = {
                backgroundColor             = '#000000',
                color                       = '#ffffff'
            },
            icon                            = 'car',
            type                            = 'error',
            iconColor                       = '#FFFFFF'
        },
    },
    ['cardealer'] = {
        ['Open'] = {
            id                              = 'cardealer_open',
            title                           = "Informations",
            description                     = "Ouvert",
            position                        = 'top',
            style = {
                backgroundColor             = '#000000',
                color                       = '#ffffff'
            },
            icon                            = 'box',
            type                            = 'error',
            iconColor                       = '#FFFFFF'
        },
        ['Close'] = {
            id                              = 'cardealer_close',
            title                           = "Informations",
            description                     = "Fermer",
            position                        = 'top',
            style = {
                backgroundColor             = '#000000',
                color                       = '#ffffff'
            },
            icon                            = 'car',
            type                            = 'error',
            iconColor                       = '#FFFFFF'
        },
    }
}
