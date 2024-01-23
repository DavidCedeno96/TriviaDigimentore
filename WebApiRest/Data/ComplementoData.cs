using System.Data.SqlClient;
using System.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;

namespace WebApiRest.Data
{
    public class ComplementoData
    {
        private readonly Conexion conexion = new();

        public async Task<ComplementoItem> GetComplemento(int idSala)
        {
            ComplementoItem item = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_Complemento", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@idSala", idSala);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                await sqlConnection.OpenAsync();
                SqlDataReader dr = await cmd.ExecuteReaderAsync();
                if (await dr.ReadAsync())
                {
                    item.Complemento = new Complemento()
                    {
                        IdCom = Convert.ToInt32(dr["idCom"].ToString()),
                        IdSala = Convert.ToInt32(dr["idSala"].ToString()),
                        ViendoIzquierda = dr["viendoIzquierda"].ToString(),
                        ViendoDerecha = dr["viendoDerecha"].ToString(),
                        Color1 = dr["color1"].ToString(),
                        Color2 = dr["color2"].ToString(),
                        Plataforma1 = dr["plataforma1"].ToString(),
                        Plataforma2 = dr["plataforma2"].ToString(),
                        Plataforma3 = dr["plataforma3"].ToString(),
                        Plataforma4 = dr["plataforma4"].ToString(),
                        Decoracion1 = dr["decoracion1"].ToString(),
                        Decoracion2 = dr["decoracion2"].ToString(),
                        Decoracion3 = dr["decoracion3"].ToString(),
                        Decoracion4 = dr["decoracion4"].ToString(),
                        ObjetoCielo1 = dr["objetoCielo1"].ToString(),
                        ObjetoCielo2 = dr["objetoCielo2"].ToString(),
                        ObjetoFondo1 = dr["objetoFondo1"].ToString(),
                        ObjetoFondo2 = dr["objetoFondo2"].ToString(),
                        ObjetoFondo3 = dr["objetoFondo3"].ToString(),
                        ObjetoFondo4 = dr["objetoFondo4"].ToString(),
                        ObjetoFondoMovil = dr["objetoFondoMovil"].ToString(),
                        ObjetoFinal = dr["objetoFinal"].ToString(),
                        Sonido = dr["sonido"].ToString(),

                        IsDecoration = Convert.ToInt32(dr["isDecoration"].ToString()),
                        IsSkyObjects = Convert.ToInt32(dr["isSkyObjects"].ToString()),
                        IsBackgroundObjects = Convert.ToInt32(dr["isBackgroundObjects"].ToString()),
                        IsFinalObject = Convert.ToInt32(dr["isFinalObject"].ToString()),

                        FechaCreacion = Convert.ToDateTime(dr["fecha_creacion"].ToString()),
                        FechaModificacion = Convert.ToDateTime(dr["fecha_modificacion"].ToString()),
                    };

                    //item.Com .Add(new Complemento()
                    //{
                                               
                    //});
                }
                await dr.NextResultAsync();

                item.Info = cmd.Parameters["@info"].Value.ToString();
                item.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());
            }
            catch (Exception ex)
            {
                item.Info = ex.Message;
                item.Error = 1;
                item.Complemento = null;
            }
            finally
            {
                await sqlConnection.CloseAsync();
            }

            return item;
        }

        public async Task<Response> CreateComplemento(Complemento complemento)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_C_Complemento", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idSala", complemento.IdSala);
            cmd.Parameters.AddWithValue("@viendoIzq", complemento.ViendoIzquierda);
            cmd.Parameters.AddWithValue("@viendoDer", complemento.ViendoDerecha);
            cmd.Parameters.AddWithValue("@color1", complemento.Color1);
            cmd.Parameters.AddWithValue("@color2", complemento.Color2);
            cmd.Parameters.AddWithValue("@plat1", complemento.Plataforma1);
            cmd.Parameters.AddWithValue("@plat2", complemento.Plataforma2);
            cmd.Parameters.AddWithValue("@plat3", complemento.Plataforma3);
            cmd.Parameters.AddWithValue("@plat4", complemento.Plataforma4);
            cmd.Parameters.AddWithValue("@dec1", complemento.Decoracion1);
            cmd.Parameters.AddWithValue("@dec2", complemento.Decoracion2);
            cmd.Parameters.AddWithValue("@dec3", complemento.Decoracion3);
            cmd.Parameters.AddWithValue("@dec4", complemento.Decoracion4);
            cmd.Parameters.AddWithValue("@objCie1", complemento.ObjetoCielo1);
            cmd.Parameters.AddWithValue("@objCie2", complemento.ObjetoCielo2);
            cmd.Parameters.AddWithValue("@objFon1", complemento.ObjetoFondo1);
            cmd.Parameters.AddWithValue("@objFon2", complemento.ObjetoFondo2);
            cmd.Parameters.AddWithValue("@objFon3", complemento.ObjetoFondo3);
            cmd.Parameters.AddWithValue("@objFon4", complemento.ObjetoFondo4);
            cmd.Parameters.AddWithValue("@objFonMov", complemento.ObjetoFondoMovil);
            cmd.Parameters.AddWithValue("@objFinal", complemento.ObjetoFinal);
            cmd.Parameters.AddWithValue("@sonido", complemento.Sonido);

            cmd.Parameters.AddWithValue("@isDecoration", complemento.IsDecoration);
            cmd.Parameters.AddWithValue("@isSkyObjects", complemento.IsSkyObjects);
            cmd.Parameters.AddWithValue("@isBackgroundObjects", complemento.IsBackgroundObjects);
            cmd.Parameters.AddWithValue("@isFinalObject", complemento.IsFinalObject);            



            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                await sqlConnection.OpenAsync();
                await cmd.ExecuteNonQueryAsync();

                response.Info = cmd.Parameters["@info"].Value.ToString();
                response.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());

            }
            catch (Exception ex)
            {
                response.Info = ex.Message;
                response.Error = 1;
            }
            finally
            {
                await sqlConnection.CloseAsync();
            }

            return response;
        }

        public async Task<Response> UpdateComplemento(Complemento complemento)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_U_Complemento", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idCom", complemento.IdCom);
            cmd.Parameters.AddWithValue("@viendoIzq", complemento.ViendoIzquierda);
            cmd.Parameters.AddWithValue("@viendoDer", complemento.ViendoDerecha);
            cmd.Parameters.AddWithValue("@color1", complemento.Color1);
            cmd.Parameters.AddWithValue("@color2", complemento.Color2);
            cmd.Parameters.AddWithValue("@plat1", complemento.Plataforma1);
            cmd.Parameters.AddWithValue("@plat2", complemento.Plataforma2);
            cmd.Parameters.AddWithValue("@plat3", complemento.Plataforma3);
            cmd.Parameters.AddWithValue("@plat4", complemento.Plataforma4);
            cmd.Parameters.AddWithValue("@dec1", complemento.Decoracion1);
            cmd.Parameters.AddWithValue("@dec2", complemento.Decoracion2);
            cmd.Parameters.AddWithValue("@dec3", complemento.Decoracion3);
            cmd.Parameters.AddWithValue("@dec4", complemento.Decoracion4);
            cmd.Parameters.AddWithValue("@objCie1", complemento.ObjetoCielo1);
            cmd.Parameters.AddWithValue("@objCie2", complemento.ObjetoCielo2);
            cmd.Parameters.AddWithValue("@objFon1", complemento.ObjetoFondo1);
            cmd.Parameters.AddWithValue("@objFon2", complemento.ObjetoFondo2);
            cmd.Parameters.AddWithValue("@objFon3", complemento.ObjetoFondo3);
            cmd.Parameters.AddWithValue("@objFon4", complemento.ObjetoFondo4);
            cmd.Parameters.AddWithValue("@objFonMov", complemento.ObjetoFondoMovil);
            cmd.Parameters.AddWithValue("@objFinal", complemento.ObjetoFinal);
            cmd.Parameters.AddWithValue("@sonido", complemento.Sonido);
            cmd.Parameters.AddWithValue("@isDecoration", complemento.IsDecoration);
            cmd.Parameters.AddWithValue("@isSkyObjects", complemento.IsSkyObjects);
            cmd.Parameters.AddWithValue("@isBackgroundObjects", complemento.IsBackgroundObjects);
            cmd.Parameters.AddWithValue("@isFinalObject", complemento.IsFinalObject);


            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                await sqlConnection.OpenAsync();
                await cmd.ExecuteNonQueryAsync();

                response.Info = cmd.Parameters["@info"].Value.ToString();
                response.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());

            }
            catch (Exception ex)
            {
                response.Info = ex.Message;
                response.Error = 1;
            }
            finally
            {
                await sqlConnection.CloseAsync();
            }

            return response;
        }
    }
}
