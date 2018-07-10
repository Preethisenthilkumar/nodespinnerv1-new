package main

import (
	"flag"
	"fmt"
	"os"

	"github.com/pkg/errors"
	"gitlab.com/tokend/keypair"
)

var (
	public   = flag.String("public", "", "")
	generate = flag.Bool("generate", false, "")
)

func cli() error {
	switch {
	case *public != "":
		kp, err := keypair.ParseSeed(*public)
		if err != nil {
			return errors.Wrap(err, "failed to parse kp")
		}
		fmt.Println(kp.Address())
	case *generate == true:
		kp, err := keypair.Random()
		if err != nil {
			return errors.Wrap(err, "failed to generate kp")
		}
		fmt.Println(kp.Seed())
	}
	return nil
}

func main() {
	flag.Parse()
	if err := cli(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
