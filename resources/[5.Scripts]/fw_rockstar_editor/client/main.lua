local function RockstarEditor()
    lib.registerContext({
        id = 'menu',
        title = 'Rockstar Editor',
        options = {
          {
            title = 'Enregistrer',
            onSelect = function()
                StartRecording(1)
                lib.notify({
                    id = 'record',
                    title = 'Rockstar Editor',
                    description = 'Enregistrement en cours',
                    position = 'top',
                    style = {
                        backgroundColor = '#000000',
                        color = '#FFFFFF',
                        ['.description'] = {
                          color = '#FFFFFF'
                        }
                    },
                    icon = 'video',
                    iconColor = '#FFFFFF'
                })
            end
          },
          {
            title = 'Enregistrer le clip',
            onSelect = function()
                StartRecording(0)
                StopRecordingAndSaveClip()
                lib.notify({
                    id = 'save',
                    title = 'Rockstar Editor',
                    description = 'Sauvegardé avec succès',
                    position = 'top',
                    style = {
                        backgroundColor = '#000000',
                        color = '#FFFFFF',
                        ['.description'] = {
                          color = '#FFFFFF'
                        }
                    },
                    icon = 'video-slash',
                    iconColor = '#FFFFFF'
                })
            end
          },
          {
            title = 'Supprimer le clip',
            onSelect = function()
                StopRecordingAndDiscardClip()
                lib.notify({
                    id = 'delete',
                    title = 'Rockstar Editor',
                    description = 'Enregistrement annulé',
                    position = 'top',
                    style = {
                        backgroundColor = '#000000',
                        color = '#FFFFFF',
                        ['.description'] = {
                          color = '#FFFFFF'
                        }
                    },
                    icon = 'video-slash',
                    iconColor = '#FFFFFF'
                })
            end
          },
          {
            title = 'Ouvrir Rockstar Editor',
            onSelect = function()
                NetworkSessionLeaveSinglePlayer()
                ActivateRockstarEditor()
            end
          },
        }
    })
    lib.showContext('menu')
end

RegisterCommand('rockstareditor', RockstarEditor, false)