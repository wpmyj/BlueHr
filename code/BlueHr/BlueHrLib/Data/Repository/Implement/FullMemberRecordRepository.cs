﻿using BlueHrLib.Data.Model.Search;
using BlueHrLib.Data.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BlueHrLib.Data.Repository.Implement
{
    public class FullMemberRecordRepository : RepositoryBase<FullMemberRecord>, IFullMemberRecordRepository
    {
        private BlueHrDataContext context;

        public FullMemberRecordRepository(IDataContextFactory dc) : base(dc)
        {
            this.context = dc.Context as BlueHrDataContext;
        }

        public bool Create(FullMemberRecord certf)
        {
            try
            {
                this.context.GetTable<FullMemberRecord>().InsertOnSubmit(certf);
                this.context.SubmitChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool DeleteById(int id)
        {
            FullMemberRecord cp = this.context.GetTable<FullMemberRecord>().FirstOrDefault(c => c.id.Equals(id));

            if (cp != null)
            {
                this.context.GetTable<FullMemberRecord>().DeleteOnSubmit(cp);
                this.context.SubmitChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        public FullMemberRecord FindById(int id)
        {
            FullMemberRecord cp = this.context.GetTable<FullMemberRecord>().FirstOrDefault(c => c.id.Equals(id));
            return cp;
        }

        public IQueryable<FullMemberRecord> Search(FullMemberRecordSearchModel searchModel)
        {
            IQueryable<FullMemberRecord> certf = this.context.FullMemberRecord;
            if (!string.IsNullOrEmpty(searchModel.StaffNr))
            {
                certf = certf.Where(c => c.staffNr.Contains(searchModel.StaffNr.Trim()));
            }
            return certf;
        }

        public bool Update(FullMemberRecord fmr)
        {
            FullMemberRecord mr1 = this.context.GetTable<FullMemberRecord>().FirstOrDefault(c => c.id.Equals(fmr.id));

            if (mr1 != null)
            {
                mr1.staffNr = fmr.staffNr;
                mr1.isPassCheck = fmr.isPassCheck;
                mr1.checkScore = fmr.checkScore;
                mr1.beFullAt = fmr.beFullAt;
                mr1.remark = fmr.remark;
                mr1.checkAt = fmr.checkAt;
                mr1.beFullChecker = fmr.beFullChecker;
                mr1.approvalAt = fmr.approvalAt;
                mr1.approvalStatus = fmr.approvalStatus;
                mr1.approvalRemark = fmr.approvalRemark;
                mr1.createdAt = fmr.createdAt;
                mr1.userId = fmr.userId;
                this.context.SubmitChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        public List<FullMemberRecord> GetAll()
        {
            return this.context.GetTable<FullMemberRecord>().ToList();
        }

        public List<FullMemberRecord> GetAllTableName()
        {
            try
            {
                return (this.context.GetTable<FullMemberRecord>()).ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<FullMemberRecord> FindBystaffNr(string staffNr)
        {
            List<FullMemberRecord> rp = this.context.GetTable<FullMemberRecord>().Where(r => r.staffNr == staffNr).ToList();
            return rp;
        }
    }
}