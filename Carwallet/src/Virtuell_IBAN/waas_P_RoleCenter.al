page 50320 waas_P_RoleCenter
{
    PageType = RoleCenter;
    CaptionML = ENU = 'Wallet Dashboard', DEU = 'Wallet Dashboard';

    layout
    {
        area(RoleCenter)
        {
            part(BrokerView; BrokerView)
            {
                ApplicationArea = Suite;
            }
            part(Control16; waas_P_Activities)
            {
                AccessByPermission = TableData WaaS_T_ActivitiesCue = I;
                ApplicationArea = Basic, Suite;
            }
            part("User Tasks Activities"; "User Tasks Activities")
            {
                ApplicationArea = Suite;
            }
            part("Emails"; "Email Activities")
            {
                ApplicationArea = Basic, Suite;
            }

            systempart(MyNotes; MyNotes)
            {
                ApplicationArea = Basic, Suite;
            }

        }

    }



    actions
    {


        area(processing)
        {

            group("Porsche Holding Wallet")
            {
                group(Wallets)
                {
                    action(WalletList)
                    {
                        CaptionML = ENU = 'Walletlist',
                                DEU = 'Walletliste';
                        RunObject = page waas_P_List;
                        ApplicationArea = All;

                    }
                    action(Customer)
                    {
                        CaptionML = ENU = 'Business Customers',
                                DEU = 'Geschäftskunden';
                        RunObject = page WaaS_P_Companies;
                        ApplicationArea = All;

                    }
                    action(PrivatWallet)
                    {
                        CaptionML = ENU = 'Privat Customers',
                                DEU = 'Privatkunden';
                        RunObject = page WaaS_P_Persons;
                        ApplicationArea = All;

                    }
                }
                group("Settings3")
                {
                    CaptionML = ENU = 'Settings',
                                DEU = 'Einstellungen';
                    // Creates a sub-menu
                    action("Wallet Settings")
                    {
                        ApplicationArea = All;
                        RunObject = page API_P_Partners;
                    }
                    action(Product_and_Services3)
                    {
                        CaptionML = ENU = 'Product & Servcie Family',
                                DEU = 'Product & Service Gruppen';
                        ApplicationArea = All;
                        RunObject = page WaaS_P_vItemGroups;
                    }
                    action(Product_Groups3)
                    {
                        CaptionML = ENU = 'Product & Service',
                                DEU = 'Produkt & Service';
                        ApplicationArea = All;
                        RunObject = page WaaS_P_vItems;

                    }
                    action(Preise3)
                    {
                        CaptionML = ENU = 'Pricing',
                                DEU = 'Preise';
                        ApplicationArea = All;
                        RunObject = page WaaS_P_vItems_price;
                    }

                    action("Wallet Demo Installer")
                    {
                        RunObject = codeunit WaaS_Installer;
                        ApplicationArea = All;
                    }

                }

            }
        }



    }
}



