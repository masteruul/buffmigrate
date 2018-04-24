package grifts

import (
	"github.com/gobuffalo/buffalo"
	"github.com/masteruul/buffmigrate/actions"
)

func init() {
	buffalo.Grifts(actions.App())
}
