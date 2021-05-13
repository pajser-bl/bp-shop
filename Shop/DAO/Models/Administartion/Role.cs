using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.DAO
{
    class Role:NameDesc
    {
        public int id_organisation;
        public Organisation organisation;
        public List<Permission> permissions;
    }
}
