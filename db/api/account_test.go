package api

import (
	"testing"

	db "github.com/abhinsyam/simplebank/db/sqlc"
	"github.com/abhinsyam/simplebank/db/util"
	"github.com/golang/mock/gomock"
)

func TestGetAccountAPI(t *testing.T) {
	//account := randomAccount()

	ctrl := gomock.NewController(t)
	defer ctrl.Finish()

	//store := mockdb.NewMockStore(ctrl)

	// build stubs
	// skipped - Section 2 - 15 lec mockdb
}

func randomAccount() db.Account {
	return db.Account{
		ID:       util.RandomInt(1, 1000),
		Owner:    util.RandomOwnerName(),
		Balance:  util.RandomMoney(),
		Currency: util.RandomCurrency(),
	}
}
